node
{
    stage('GetParameters'){
        List props = []
        List params = [
        string(name: 'PROJECT_NAME', description: 'Please Enter the name of the project.')
        props << parameters(params)
        properties(props)   
        ]
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
