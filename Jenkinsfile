pipeline {
    agent any

    environment {
       APP_NAME = "my-java-app" 
       APP_VERSION = "1.0"
       APP_ENV = "production"
    }

    parameters {
      string(name: "APP_NAME", defaultValue: "dennis-java-app", description: "Name of the application")
    }
    
    stages {
        // stage('Checkout') {
            // steps {
            //     git 'https://github.com/your-username/jenkins-java-demo.git'
            // }
        // }
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
                echo 'Deploying $APP_NAME version $APP_VERSION to $APP_ENV environment...'
                '''
            }
        }
    }
}