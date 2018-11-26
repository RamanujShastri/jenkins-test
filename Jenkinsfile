<<<<<<< HEAD

node
{
    stage('GetParameters'){
        List props = []
        List params = [
        string(name: 'Access_key', description: 'Please Enter the AWS Access Key.'),
        string(name: 'Secret_key', description: 'Please Enter the AWS Secret Key.')
        ]
        props << parameters(params)
        properties(props)   
        
    }
    stage('Checkout'){
        echo 'Checkout Branch'
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/RamanujShastri/jenkins-test']]])
        
    }
    stage('Build'){
        echo 'Build'
        sh 'bash run.sh'
    }
}
=======
properties([parameters([credentials(credentialType: 'com.cloudbees.jenkins.plugins.awscredentials.AWSCredentialsImpl', defaultValue: '', description: '', name: 'aws-credentials', required: false)])])
node
{
    stage('GetParameters'){
        echo "Get Parameters"
        
    }
    stage('Checkout'){
        echo 'Checkout Branch'
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/RamanujShastri/jenkins-test']]])
        
    }
    stage('Build'){
        echo 'Build'
        sh 'bash run.sh'
    }
}
>>>>>>> 859fdaf2c5e0b5f24a346023094a5b2adeeb80d3
