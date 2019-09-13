pipeline {
    agent any //{ label 'master' }
//    options {
//      timestamps()
//    }
    stages {
        stage('Remote') {
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
        stage('ruby no 2') {
//            agent {
//                label 'Ruby'
//            }
            steps {
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
