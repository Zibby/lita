pipeline {
  agent {
    docker {
      image 'litaio/lita'
    }

  }
  stages {
    stage('error') {
      parallel {
        stage('error') {
          steps {
            fileExists 'lita_config.rb'
          }
        }
        stage('qoo') {
          steps {
            isUnix()
          }
        }
        stage('bundle') {
          steps {
            sh 'bundle install'
          }
        }
      }
    }
  }
}