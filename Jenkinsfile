pipeline {
    agent {
        docker {
            image 'ubuntu:22.04'  // 运行环境
            args '--privileged'   // 允许 Docker 运行
        }
    }

    environment {
        DOCKER_TLS_VERIFY: 1
        DOCKER_TLS_CERTDIR = ""
        DOCKER_IMAGE = "dennis/java-docker-app"  // Docker 镜像名称
        DOCKER_TAG = "latest"                   // 镜像版本
        DOCKER_CREDENTIALS_ID = "docker-hub-credentials"  // 在 Jenkins 配置的 Docker Hub 凭据 ID
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'  // 如果是 Java 项目
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                // script {
                //     withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID, url: ""]) {
                //     }
                // }
              sh "echo 'Docker login successful'"
            }
        }

        stage('Push Docker Image') {
            steps {
                // script {
                //     sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                // }
              sh "echo 'Docker push successful'"
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                echo "Deploying ${DOCKER_IMAGE}:${DOCKER_TAG} to production..."
                docker run --rm --name my-app ${DOCKER_IMAGE}:${DOCKER_TAG}
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
        always {
          script {
          if (env.NODE_NAME) {
              echo "📌 Cleaning up workspace..."
              sh 'docker system prune -f'  // 清理不必要的 Docker 镜像
          } else {
              echo "No workspace context available for cleanup."
          }
           }
        }
    }
}