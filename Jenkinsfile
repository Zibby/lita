pipeline {
  agent {
    docker {
      image 'litaio/lita'
    }

  }
  stages {
    stage('git pull') {
      steps {
        sh 'bundle install --path ./.gem'
        sh 'HOME=./ bundle exec rubocop'
        cleanWs(cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, cleanupMatrixParent: true, deleteDirs: true)
        slackSend botUser: true, message: 'built job', tokenCredentialId: 'slack-token'
      }
    }
  }
}
