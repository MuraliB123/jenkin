pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub
                git url: 'https://github.com/MuraliB123/jenkin.git', branch: 'main'
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

