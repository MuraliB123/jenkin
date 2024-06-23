pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = 'github-token1' // The ID of the Git credentials stored in Jenkins
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub
                git clone 'https://github.com/MuraliB123/jenkin.git'
            }
        }

        stage('Execute Python Script') {
            steps {
                // Execute the Python script with the folder containing SQL files
                script {
                    if (isUnix()) {
                        sh 'python3 insert_xml.py ./folder'
                    } else {
                        bat 'python insert_xml.py .\\folder'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                // Continue with the build process
                echo 'Building...'
                // Add your build steps here
            }
        }
    }
}
