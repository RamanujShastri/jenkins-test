properties([parameters([credentials(credentialType: 'com.cloudbees.jenkins.plugins.awscredentials.AWSCredentialsImpl', defaultValue: '', description: '', name: 'aws-credentials', required: false)])])

node
{
    stage('GetParameters'){
        echo "Get parameters"
        
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
