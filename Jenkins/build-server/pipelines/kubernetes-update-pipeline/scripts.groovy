// does a redeploy of the selected kubernetes deployments, forcing new app image pulls
def updateDeployment(image){
    tokens = image.split('-')
    deployment = tokens[0] + '-dep'
    print "updating deployment: " + deployment
    sh "kubectl --kubeconfig ${KUBECONFIG} rollout restart deployment -n default ${deployment}"
}

return this