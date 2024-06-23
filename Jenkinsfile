pipeline {
    agent any

    environment {
        GIT_CREDENTIALS_ID = 'github-token' // The ID of the Git credentials stored in Jenkins
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub
                git url: 'https://github.com/MuraliB123/jenkin.git', branch: 'master', credentialsId: "${GIT_CREDENTIALS_ID}"
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

        stage('Commit and Push Changes') {
            steps {
                script {
                    if (isUnix()) {
                        sh '''
                            git config user.name "MuraliB123"
                            git config user.email "muralibabu1729@gmail.com"
                            git add .
                            git commit -m "Automated commit: Inserted XML files"
                            git push origin main
                        '''
                    } else {
                        bat '''
                            git config user.name "MuraliB123"
                            git config user.email "muralibabu1729@gmail.com"
                            git add .
                            git commit -m "Automated commit: Inserted XML files"
                            git push origin main
                        '''
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
