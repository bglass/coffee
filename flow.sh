setenv Project cortado
setenv Location ~/work/zeghetmar

cd $Location
rails new $Project

# http://stackoverflow.com/questions/16455801/ruby-on-rails-make-slim-the-default-template

cd $Location/$Project
echo "gem 'slim-rails'\n" >> Gemfile
sed -i "/config.active_record.raise_in_transactional_callbacks = true/a \\n    config.generators do |g|\n      g.template_engine :slim\n    end\n" config/application.rb
sed -i '/therubyracer/s/^# //' Gemfile

bundle install --without production

 git init
 git add -A
 git commit -m "Initialize repository"
 git remote add origin git@github.com:bglass/cortado.git
 # git push --force --set-upstream origin master
 git push -u origin --all

rails g scaffold order
rails g scaffold product name:string
rails g scaffold person name:string feature:string

rails g scaffold like person_id:integer product_id:integer count:integer
rails g scaffold choice order_id:integer person_id:integer product_id:integer
rails g scaffold contact person_id:integer person_id:integer count:integer




bundle exec rake db:migrate

rails server -b localhost -p 3000

rails generate controller StaticPages jqm


current! 2
3
