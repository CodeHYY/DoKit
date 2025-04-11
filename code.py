# -*- coding: utf-8 -*-
import os  # 导入操作系统模块，用于文件和目录操作
import re  # 导入正则表达式模块，用于匹配导入语句
import sys # 导入系统模块，用于退出脚本等

# --- 配置区域 ---
# DoraemonKit 源代码目录相对于本脚本（工程根目录）的路径
doraemon_root = "iOS/DoraemonKit/Src/Core"
# 需要扫描并修改的你的项目源代码目录列表，相对于本脚本（工程根目录）
project_source_roots = [
"iOS/DoraemonKit/Src/Core/Base", "iOS/DoraemonKit/Src/Core/Cache", "iOS/DoraemonKit/Src/Core/Category", "iOS/DoraemonKit/Src/Core/CommonUI", "iOS/DoraemonKit/Src/Core/Define", "iOS/DoraemonKit/Src/Core/Entry", "iOS/DoraemonKit/Src/Core/Manager", "iOS/DoraemonKit/Src/Core/Network", "iOS/DoraemonKit/Src/Core/Plugin", "iOS/DoraemonKit/Src/Core/Util"
#    "YourApp",          # 替换成你的主要 App 源码文件夹名称
#    "YourOtherModule"   # 如果有其他模块或 Pod 的源码也需要修改，继续添加
    # 在这里添加更多包含你的 .m, .mm, .h 文件的目录名
]
# 需要处理的文件扩展名
file_extensions = ('.m', '.mm', '.h')
# --- 配置结束 ---

# 初始化一个空字典，用于存储头文件名到其完整相对路径的映射
header_map = {}
# 获取 DoraemonKit 目录的绝对路径
doraemon_abs_root = os.path.abspath(doraemon_root)

print(f"正在扫描 {doraemon_abs_root} 以查找头文件...")

# --- 第 1 步: 构建头文件路径映射表 ---
# 遍历 DoraemonKit 目录及其所有子目录
for root, dirs, files in os.walk(doraemon_abs_root):
    # 遍历当前目录下的所有文件
    for file in files:
        # 如果文件是以 .h 结尾的头文件
        if file.endswith(".h"):
            header_name = file # 获取头文件名，例如 "DoraemonNSLogModel.h"
            full_path = os.path.join(root, file) # 获取头文件的完整绝对路径
            # 计算头文件相对于当前工作目录（也就是工程根目录）的相对路径
            relative_path = os.path.relpath(full_path, start=os.getcwd())
            # 将路径分隔符统一替换为 Unix 风格的 '/' (因为 #import 中使用 '/')
            relative_path = relative_path.replace(os.path.sep, '/')

            # 检查是否存在同名的头文件（理论上不常见，但需要处理）
            if header_name in header_map:
                # 如果存在同名文件，打印警告并覆盖（以最后找到的为准）
                # 如果确实有重要同名文件，这里的处理逻辑可能需要调整
                print(f"警告: 发现重复的头文件名 '{header_name}'。将覆盖路径。")
                print(f"  旧路径: {header_map[header_name]}")
                print(f"  新路径: {relative_path}")
            # 将 文件名 -> 相对路径 的映射存入字典
            header_map[header_name] = relative_path

print(f"在 {doraemon_root} 中找到 {len(header_map)} 个唯一的头文件。")
# 如果一个头文件都没找到，说明配置可能错误，直接退出
if not header_map:
    print("错误: 未找到任何头文件。请检查 'doraemon_root' 配置是否正确。")
    sys.exit(1) # 退出脚本

# --- 第 2 步: 扫描项目源文件并替换导入语句 ---
# 定义一个正则表达式，用于查找 #import "..." 格式的行
# re.compile 预编译正则表达式，提高效率
# #import\s*   匹配 #import 和任意数量的空格
# "(.*?)"      匹配双引号内的任意字符（非贪婪模式），并捕获引号内的内容（文件名）
import_regex = re.compile(r'#import\s*"(.*?)"')

print(f"正在扫描项目源代码目录: {project_source_roots}")
files_processed = 0 # 记录处理的文件总数
files_modified = 0  # 记录被修改的文件总数

# 遍历配置中指定的每个项目源代码根目录
for source_root in project_source_roots:
    source_abs_root = os.path.abspath(source_root) # 获取源代码目录的绝对路径

    # 如果配置的目录不存在，打印警告并跳过
    if not os.path.isdir(source_abs_root):
        print(f"警告: 源代码目录 '{source_root}' 未找到。跳过。")
        continue

    # 遍历源代码目录及其所有子目录
    for root, dirs, files in os.walk(source_abs_root):
    
        # 重要：防止脚本处理 DoraemonKit 目录自身的文件（如果它碰巧在 source_root 下）
#        if doraemon_abs_root in os.path.abspath(root):
#             continue # 如果当前目录在 DoraemonKit 目录下，则跳过
#        print(f"警告2: 源代码目录 '{files}' 未找到。跳过。")

        # 遍历当前目录下的所有文件
        for file in files:
            # 检查文件扩展名是否是我们需要处理的类型
            if file.endswith(file_extensions):
                file_path = os.path.join(root, file) # 获取文件的完整路径
                files_processed += 1 # 处理文件计数器加 1
                made_change = False   # 标记当前文件是否被修改
                updated_lines = []    # 用于存储修改后的文件内容（按行）

                try:
                    # 以 UTF-8 编码读取文件内容
                    with open(file_path, 'r', encoding='utf-8') as f:
                        lines = f.readlines() # 读取所有行

                    # 遍历文件的每一行
                    for line in lines:
                        # 尝试用正则表达式匹配行（去除首尾空格后）
                        match = import_regex.match(line.strip())
                        # 如果匹配成功（是 #import "..." 格式）
                        if match:
                            # 提取引号内的导入内容，例如 "DoraemonNSLogModel.h" 或 "Sub/Header.h"
                            imported_header = match.group(1)
                            # 获取导入内容中的基本文件名（去掉可能存在的子目录前缀）
                            base_header_name = os.path.basename(imported_header)

                            # 检查这个基本文件名是否存在于我们之前构建的 DoraemonKit 头文件映射表中
                            if base_header_name in header_map:
                                # 如果找到了对应的 DoraemonKit 头文件
                                # 获取映射表中该头文件的目标完整相对路径
                                target_path = header_map[base_header_name]

                                # --- 核心判断逻辑：决定是否替换 ---
                                # 1. 检查当前导入语句是否 *已经* 是我们想要的目标路径？如果是，则不替换。
                                # 2. 检查当前导入语句是否 *已经* 是以 "DoraemonKit/" 开头的？
                                #    这是一种启发式判断，假设已经是这种形式的导入是正确的或已被修改过，避免重复修改或改错其他库的同名文件。
                                if imported_header != target_path and not imported_header.startswith(doraemon_root + '/'):
                                    # 如果以上两个条件都不满足（即：它不是目标路径，也不是以DoraemonKit/开头）
                                    # 就认为这是一个需要被替换的简单导入语句
                                    print(f"  在 {os.path.relpath(file_path)} 文件中进行替换:")
                                    print(f"    - {line.strip()}") # 打印原始行
                                    # 构建新的导入行，使用映射表中的完整相对路径
                                    new_line = f'#import "{target_path}"\n'
                                    print(f"    + {new_line.strip()}") # 打印替换后的行
                                    updated_lines.append(new_line) # 将新行添加到结果列表
                                    made_change = True # 标记此文件已被修改
                                else:
                                    # 如果导入语句已经是目标路径或以 DoraemonKit/ 开头，则保留原始行
                                    updated_lines.append(line)
                            else:
                                # 如果 import 的头文件名不在我们的 DoraemonKit 映射表中，保留原始行
                                updated_lines.append(line)
                        else:
                            # 如果当前行不是 #import "..." 格式，保留原始行
                            updated_lines.append(line)

                    # 如果当前文件有任何行被修改过
                    if made_change:
                        files_modified += 1 # 修改文件计数器加 1
                        # 以 UTF-8 编码写回文件，覆盖原有内容
                        with open(file_path, 'w', encoding='utf-8') as f:
                            f.writelines(updated_lines)

                # 捕获并打印处理单个文件时可能发生的异常
                except Exception as e:
                    print(f"处理文件 {file_path} 时出错: {e}")

# --- 脚本执行完毕 ---
print("-" * 20)
print(f"扫描完成。")
print(f"总共处理文件数: {files_processed}")
print(f"总共修改文件数: {files_modified}")
print("强烈建议在提交前使用 git diff 命令仔细检查所有更改。")
