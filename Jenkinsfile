pipeline {
    agent { label 'master' }
    options {
      timestamps()
    }
    stages {
        stage('Build') {
            agent {label 'Ruby'}
            when { 
                changeRequest() 
            }
            steps {
                sh("printenv")
                sh "ip address"
            }
        }
        stage('Test on Linux') {
            steps {
                 sh("printenv")
            }
        }
        stage('Test on Windows') {
            agent {
                label 'Ruby'
            }
            steps {
               sh("printenv")
               sh "whoami"
               echo 'deploying'
               sh "git branch"
               sh "pwd"
               sh "ls -al"
               echo "finished"
            }
        }
    }
}
