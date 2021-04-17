def getModifiedApps(applications){
    modified = [] 
    def apps = applications.split(",")
    for(app in apps){
        if(checkFolderForDiffs(APPS_PATH + app + "/"))
            modified.add(app)
    }
    return modified
}

def apply (collection, func){
    for (item in collection){
        func(item)
    }
}

def updateDeployment(deployment){
    folder = APPS_PATH + deployment + "/"
    print "deleting old resources from folder: " + folder
    sh "kubectl --kubeconfig ${KUBECONFIG} delete -f ${folder}"
    print "applying folder: " + folder
    sh "kubectl --kubeconfig ${KUBECONFIG} apply -f ${folder}"
}

def checkFolderForDiffs(path) {
    try {
        // git diff will return 1 for changes (failure) which is caught in catch, or
        // 0 meaning no changes 
        sh "git diff --quiet --exit-code HEAD~1..HEAD ${path}"
        return false
    } catch (err) {
        return true
    }
}

return this