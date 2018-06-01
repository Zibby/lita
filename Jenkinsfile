pipeline {
  agent {
    docker {
      image 'litaio/lita'
    }

  }
  stages {
    stage('error') {
      parallel {
        stage('git pull') {
          steps {
            sh 'git pull'
          }
        }
        stage('bundle') {
          steps {
            sh '''
bundle install --path ./.gem'''
          }
        }
        stage('rubocop') {
          steps {
            sh 'HOME=./ bundle exec rubocop'
          }
        }
      }
    }
  }
}