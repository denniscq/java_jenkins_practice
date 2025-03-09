pipeline {
    agent any

    environment {
       APP_NAME = "my-java-app" 
       APP_VERSION = "1.0"
       APP_ENV = "production"
    }

    parameters {
      string(name: "APP_NAME1", defaultValue: "dennis-java-app", description: "Name of the application")
    }

    stages {
        stage('Build') {
            steps {
                sh 'javac Main.java'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                echo "--------------------------------"
                echo "Deploying ${params.APP_NAME1} version $APP_VERSION to $APP_ENV environment..."
                '''
            }
        }
    }
}