pipeline {
    agent none
    stages {
        stage('Build') {
            agent {label 'master'}
            when {
                // Only say hello if a "greeting" is requested
                expression { CHANGE_ID != null && CHANGE_BRANCH ==~ /feature(*)/ && CHANGE_TARGET != develop}
            }
            steps {
               sh 'exit 1'   
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
