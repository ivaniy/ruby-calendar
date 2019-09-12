pipeline {
    agent { label 'master' }
//    options {
//      timestamps()
//    }
    stages {
        stage('Remote') {
            agent {label 'Ruby'}
            when { 
                changeRequest() 
            }
            steps {
                sh("printenv")
                sh "ip address"
            }
        }
        stage('Local') {
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
