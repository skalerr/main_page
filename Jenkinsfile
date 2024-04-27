pipeline {
    agent { 
        node {
            label 'docker'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('ENV') {
             // Установка Flutter SDK
                sh '''
                    wget https://storage.googleapis.com/flutter_infra/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz
                    tar xf flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz
                    export PATH="$PATH:`pwd`/flutter/bin"
                    flutter doctor -v
                '''
        }

        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage('Build for Web') {
            steps {
                sh 'flutter pub get'
                sh 'flutter build web'
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my_flutter_app .'
            }
        }
    }
}