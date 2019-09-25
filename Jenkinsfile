pipeline {
    agent any //{ label 'master' }
//    options {
//      timestamps()
//    }
    stages {
        stage('Test branches from feature to develop') {
            agent {label 'master'}
            when {
                // Only say hello if a "greeting" is requested
                expression { CHANGE_ID != null && CHANGE_BRANCH ==~ /^feature.*/ && CHANGE_TARGET != "develop"}
            }
            steps {
               sh 'exit 1'   
            }
        }
        stage ('SonarQube code test') {
            agent {label 'master'}
            steps {
                withSonarQubeEnv('SonarQube' credentialsId: 'SonarToken' sonar.projectKey: 'my_project' sonar.projectName: 'Calenda project') {
                    
                }
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
