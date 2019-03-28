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
        slackSend botUser: true, message: 'Finished ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>', tokenCredentialId: 'slack-token'
      }
    }
  }
}
