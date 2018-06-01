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
            sh '/usr/bin/git pull'
          }
        }
        stage('qoo') {
          steps {
            isUnix()
            sh 'pwd'
          }
        }
        stage('bundle') {
          steps {
            sh '''

 echo $HOME && bundle install --path ./.gem'''
            sh 'HOME=./ bundle exec rubocop'
          }
        }
      }
    }
  }
}