# 检查是否提供了提交信息
if [ "$#" -ne 1 ]; then
    echo "用法: $0 <提交信息>"
    exit 1
fi

COMMIT_MESSAGE="$1"

echo "------------------------------"

# 添加更改
echo "--------------------------------------"
echo "-----------开始推送到GitHub-----------"
echo "--------------------------------------"

git add . || { echo "Git 添加失败"; exit 1; }
echo "-----------更改已添加到Git-----------"

# 提交更改
git commit -m "$COMMIT_MESSAGE" || { echo "Git 提交失败"; exit 1; }
echo "-----------更改成功提交，提交信息: '$COMMIT_MESSAGE'-----------"

# 强制推送到远程 main 分支
git push -f origin main || { echo "Git 推送失败"; exit 1; }

echo "------------------------------------------"
echo "-----------更改成功推送到GitHub-----------"
echo "------------------------------------------"