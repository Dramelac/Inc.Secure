SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+02:00";

DROP DATABASE IF EXISTS `appdb`;
CREATE DATABASE IF NOT EXISTS `appdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;

# Privilèges pour `webdb`@`%`
GRANT USAGE ON *.* TO 'webdb'@'%' IDENTIFIED BY PASSWORD '*55E38AC871B8C99407C20445B0AD7CA98240633B';
GRANT SELECT ON `appdb`.* TO 'webdb'@'%';


USE `appdb`;

CREATE TABLE `article` (
                         `id` int(11) NOT NULL,
                         `title` text NOT NULL,
                         `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
                         `content` text NOT NULL,
                         `author` text NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `article` (`id`, `title`, `creation_date`, `content`, `author`) VALUES
(1, 'La mise à jour d\'après', '2019-05-01 09:11:21', '<img src="/common/img/La_mise_à_jour_d_après.jpg" class="article-header" alt="Header"/><p>Eh vous ! Oui vous, qui lorsque vous recevez une notification de mise à jour vous dites « Oh non pas encore, je n’ai pas le temps, je le ferai plus tard » avant de retourner procrastiner sur Truiteur.com. Nous avons une histoire pour vous ! </p>
<p>Chaque jour de nombreuses failles dites Zero Day sont découvertes sur les logiciels ou sur les systèmes d’exploitation. Une faille 0-Day est une vulnérabilité qui n’a pas encore de correctif. Les éditeurs de logiciels travaillent donc, lorsqu’une faille de ce type est découverte, sur la création d’un correctif qui, lorsqu’il sera prêt demandera une mise à jour. Voyez-vous où nous voulons en venir ? Oui tout à fait, les mises à jour sont des éléments essentiels pour sécuriser vos appareils et ne doivent pas être négligés donc Have a Break, have an Update.</p>
', 'test'),
(2, 'How I met your locker', '2019-05-08 16:42:34', '<img src="/common/img/How_I_met_your_locker.jpg" class="article-header" alt="Header"/><p>Nous avons recueilli le témoignage de Mme Marina Yves, assistante de direction de l’entreprise Deubek. Mme Yves a été victime d’un rançongiciel ayant entrainé la perte de ses données. 
<p>En recevant ce qu’elle croyait être un courriel de son fournisseur internet, Marina Yves a cliqué sur ce qui semblait être une facture en pièce jointe. Les malfaiteurs imitent de mieux en mieux les courriels officiels, ce qui permet de tromper plus facilement l’attention des victimes. </p>
<p>En ouvrant la pièce jointe, Marina Yves a vu son disque dur être chiffré et une demande de rançon à payer sous 72 heures lui a été adressée, sous peine de perdre définitivement ses informations. Prise de panique Mme Yves s’est empressée de payer la rançon mais là fut son erreur, car la clef afin de déchiffrer son disque ne lui a jamais été envoyée !</p>
<p>Ce type de mésaventure est commun. C’est une source de perte de données importante, que ce soit pour les particuliers ou les entreprises. Mais que faire lorsque l’on est victime d’une telle attaque ?  </p>
Un peu de sensibilisation : 
<ul>
<li>Il est important de ne pas ouvrir les courriels provenant d’organisations ou de personnes inconnues. </li>
<li>Penser à vérifier le nom de domaine de provenance du courriel : les malfaiteurs imitent les courriels de certains fournisseurs d’accès par exemple, en ne changeant qu’une lettre au nom de domaine. </li>
<li>Faire attention à ce que l’orthographe du courriel ne soit pas suspecte (fautes d’orthographe ou de syntaxe). Souvent ces courriels sont aussi impersonnels (ils débutent par Madame, Monsieur). </li>
<li>Réaliser régulièrement des sauvegardes sur des supports externes. </li>
<li>Enfin, posséder un antivirus afin de scanner les pièces jointes avant de les ouvrir permet d’éviter les incidents de ce type. </li>
</ul>
<p>Parfois la sensibilisation n’est pas suffisante ou n’a pas été réalisée en interne : la personne a ouvert la pièce jointe et il est déjà trop tard. Il est alors recommandé de déconnecter les machines infectées du réseau et d’éteindre électriquement ces appareils immédiatement. Le changement des mots de passe après nettoyage des machines et du réseau est aussi une bonne pratique. Enfin, demander conseil à un expert en informatique pour être guidé dans la démarche à suivre afin de retrouver les données est souvent nécessaire, les organisations possédant rarement cette compétence. </p>
', 'admin'),
(3, 'Les démons de Wifi', '2019-05-17 23:48:51', '<img src="/common/img/Les_démons_de_wifi_.jpg" class="article-header" alt="Header"/>
<h4>BREAKING NEWS</h4></br>
<p>Un groupe de malfaiteurs informatiques a été démantelé. Cette bande d’attaquants répondant au doux pseudonyme de Hackdonald compromettait les réseaux wifi publics avec pour cible privilégiée les Fast Food. Cela prouve la faible sécurité de ces réseaux et le danger qu’ils représentent pour les données des utilisateurs ! </p>
<p>Dans ce type d’attaque, les malfrats se placent sur le réseau entre l’utilisateur et le point de connexion afin d’intercepter les informations que les utilisateurs pensent envoyer seulement au point d’accès. Les attaquants peuvent donc intercepter les échanges et accéder à des courriels et mots de passe importants. Les personnes travaillant depuis ces réseaux publics peuvent mettre en péril la sécurité de leur entreprise, car si leurs données de connexion sont interceptées elles pourront être réutilisées par les attaquants pour compromettre le réseau de l’organisation. </p>
<p>Afin d’éviter de devenir à votre tour victime de ce type d’attaque, il est recommandé de respecter certaines bonnes pratiques. Tout d’abord, il est nécessaire de naviguer en HTTPS, ce qui ajoute un niveau de chiffrement, en particulier sur les sites demandant de s’authentifier. Il est important aussi lors d’une connexion sur un réseau public de désactiver l’option partage de données de votre appareil et de toujours utiliser un antivirus actif et à jour (même sur un smartphone). Enfin, l’utilisation d’une connexion VPN permettant le chiffrement des données est une très bonne solution afin de naviguer en toute sécurité. Les attaquants recherchent en priorité les cibles les plus faciles : n’en devenez pas une ! </p>
', 'dramelac');

CREATE TABLE `user` (
                      `id` int(11) NOT NULL,
                      `username` text NOT NULL,
                      `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'demo', 'demo'),
(2, 'test', 'St0nnngP444Sw000Rdddd:D!!!!'),
(3, 'admin', 'adminpass'),
(4, 'Dramelac', 'Vm91cyB5IGV0ZXMgcHJlc3F1ZSBjb3VyYWdlICEK');


ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
