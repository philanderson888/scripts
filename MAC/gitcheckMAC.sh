echo "Updating scripts"
cd /Users/Shared/scripts
git status
git pull
git add .
git commit -m "Updating scripts"
git push
echo "Showcase"
cd /Users/Shared/showcase
git status
git pull
git add .
git commit -m "Updating Showcase"
git push

echo "learn-graph-ql"
cd /Users/Shared/learn-graph-ql
git status
git pull
git add .
git commit -m "Updating learn-graph-ql"
git push

echo "react"
cd /Users/Shared/react
git status
git pull
git add .
git commit -m "Updating React"
git push

echo "Updating vue"
cd /Users/Shared/vue
git status
git pull
git add .
git commit -m "Updating Vue"
git push

echo ""
cd /Users/Shared/
git status
git pull
git add .
git commit -m "Updating"
git push

echo "vue-firebase-app"
cd /Users/Shared/vue-firebase-app
git status
git pull
git add .
git commit -m "Updating vue-firebase-app"
git push
