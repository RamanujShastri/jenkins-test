node
{
    stage('Checkout'){
        echo 'Checkout Branch'
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/RamanujShastri/jenkins-test']]])
        
    }
    stage('Build'){
        echo 'Build'
        sh 'bash run.sh'
    }
}
