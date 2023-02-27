pipeline{
    agent{
        label "node"//IP address or name of server
    }
    stages{
        stage("cloning git repository"){
            steps{
                git branch: 'main', credentialsId: 'gmail', url: 'https://github.com/testuser-devops/Healthcheck-2.git'
            }
            
        }
        stage("Executing Powershell Script"){
            steps{
                sh '''
                chmod +x Script.ps1
                ./Script.ps1
                '''
            }
        }
    }
    
}