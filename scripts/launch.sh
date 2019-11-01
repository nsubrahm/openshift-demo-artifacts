#!/bin/bash
function init {
    INSTALL_DIR=${PWD}
    PROJECT_HOME=${INSTALL_DIR}/openshift-demo-artifacts
    SCRIPTS_HOME=${PROJECT_HOME}/scripts
}
#
function launch {
    init
    # Create all OpenShift artifacts
    ${SCRIPTS_HOME}/objects.sh
    # Launch application
    oc new-app https://github.com/nsubrahm/openshift-demo-customers
}
#
launch