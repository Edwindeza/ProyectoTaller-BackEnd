__author__ = 'klaatu'
from fabric.api import *
from fabric.colors import green

env.user = 'ubuntu'
env.host_string = '138.197.17.11'
env.password = '63cd8015434c4ac2'
home_path = "/home/ubuntu"
settings = "--settings='tramites.settings.production'"
activate_env = "source {}/tramitesvenv/bin/activate".format(home_path)
manage = "python manage.py"


def deploy():
    print("Beginning Deploy:")
    with cd("{}/tramites".format(home_path)):
        run("git pull origin master")
        run("{} && pip install -r requirements.txt".format(activate_env))
        run("{} && {} collectstatic --noinput {}".format(activate_env, manage,
                                                         settings))
        run("{} && {} migrate {}".format(activate_env, manage, settings))
        sudo("service nginx restart", pty=False)
        sudo("service supervisor restart", pty=False)
    print(green("Deploy tramites successful"))


def createsuperuser():
    with cd("{}/tramites".format(home_path)):
        run("{} && {} createsuperuser {}".format(activate_env, manage,
                                                 settings))
    print(green("Createsuperuser successful"))