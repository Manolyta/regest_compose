# REGEST

REGEST est une application NodeJS spécialisée dans la suivi de projet:

Pour déployer regest sous forme de container, il faut tout d'abord installer Git et Docker:

## Installation de Git

1. Vérifiez si Git est déjà installé sur votre système en exécutant la commande suivante dans votre terminal:
```
git --version
```

2. Si Git n'est pas installer, l'installer avec les commandes suivantes :

```
sudo apt-get update
sudo apt-get install git
```

## Installation de Docker

1. Vérifiez si Docker est déjà installé sur votre système en exécutant la commande suivante dans votre terminal:

```
docker --version
```

Si Docker est déjà installé, vous verrez la version installée. Si ce n'est pas le cas, vous pouvez continuer à suivre les étapes ci-dessous.

2. Ajoutez la clé GPG officielle de Docker en exécutant la commande suivante:

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

3. Ajoutez le référentiel Docker aux sources APT en exécutant la commande suivante:

```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

4. Mettez à jour les sources APT en exécutant la commande suivante:

```
sudo apt-get update
```

5. Installez Docker en exécutant la commande suivante:

```
sudo apt-get install docker-ce
```

6. Vérifiez que Docker est bien installé en exécutant la commande suivante:

```
sudo systemctl status docker
```

Cette commande affiche l'état de Docker. Si Docker est en cours d'exécution, vous verrez "active (running)" dans la sortie.

Vous avez maintenant installé Docker avec succès sur votre système. Vous pouvez utiliser Docker en exécutant des commandes dans votre terminal.

## Configuration de Docker (facultatif)

Après avoir installé Docker, vous pouvez configurer certaines options pour améliorer votre expérience d'utilisation. Voici quelques-unes des options courantes:

- Pour éviter d'avoir à utiliser sudo chaque fois que vous exécutez la commande Docker, vous pouvez ajouter votre utilisateur au groupe Docker en exécutant la commande suivante:

```
sudo usermod -aG docker $USER
```

Notez que cela nécessite une déconnexion/reconnexion de l'utilisateur pour prendre effet.

Si vous souhaitez modifier le répertoire de stockage des images Docker, vous pouvez modifier la configuration de Docker en éditant le fichier `/etc/docker/daemon.json` et en y ajoutant une ligne pour spécifier le chemin de stockage. Par exemple, pour utiliser un répertoire `/mnt/docker`:

```
json
{
  "data-root": "/mnt/docker"
}
```

Vous devrez redémarrer Docker après avoir modifié ce fichier de configuration.

## Déploiement de REGEST grâce à Docker

Une fois, docker en place, il faut cloner le répertoire regest_compose, puis se placer à l’intérieur :
```
$ git clone https://github.com/Manolyta/regest_compose.git
$ cd Projet-Fil-Rouge/

```

Il est ensuite nécessaire de modifier le fichier de variables d’environnement afin de venir adapter certains éléments de configuration, notamment les informations liées au réseau pour une meilleur intégration.
Il faut apporter ces éventuelles modification depuis le fichier regest_compose/.env

Une fois toutes les modifications apportées, on peut lancer les conteneurs en se plaçant dans le répertoire regest_compose :

```
$ docker compose up -d
```

Vous pouvez accéder à la page web de REGEST en utilisant l'adresse IP de votre serveur :

```
https://@IP
```

## Image Docker 

L'image Docker se trouve sur ce site:

```
https://hub.docker.com/r/regest/regest
```

## Bug 

Vous avez trouvé un bug ? Envoyez un mail à regest.app@gmail.com.



