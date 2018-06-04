# README

In order to run this project on your machine you will need

* Ruby 2.5.1
* PostgreSQL (any version after 9.6 should work)
* Yarn (check install instructions at https://yarnpkg.com/lang/en/docs/install)
* Git (of course...)
* RubyGems (be able to run `gem` command in order to install Ruby gems)

After being sure you have these requirements, you should run the following commands

* Clone the project

```
git clone https://github.com/tsolar/test-recorrido.git
```

* Go to project's directory

```
cd test-recorrido
```

* Install bundler and install gems

```
gem install bundler
bundle install
```

* Install javascript dependencies

```
yarn install
```

* Create database and run migrations

```
rails db:create db:migrate
```

* Now you should be able to run the project using `foreman`

```
foreman start -f Procfile.dev
```

To run the test suite you can run

```
rspec
```
