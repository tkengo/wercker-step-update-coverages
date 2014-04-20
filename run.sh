git clone -b gh-pages git@github.com:tkengo/hometype.git

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"

cp -R coverage hometype/coverage
cd hometype

diff=$(git status -s | grep coverage)
if [ -z $diff ]; then
    echo 'Skip gh-pages step because the coverage was not updated.'
    exit 0
fi

git add .
git commit -m "Updated code coverage: `date +'%Y-%m-%d%k:%M:%S'`"
git push origin gh-pages
