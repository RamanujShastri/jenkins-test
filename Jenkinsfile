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
