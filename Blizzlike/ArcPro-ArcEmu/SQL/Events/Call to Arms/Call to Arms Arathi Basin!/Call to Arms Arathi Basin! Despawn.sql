DELETE FROM `creature_spawns` WHERE `id` BETWEEN 434789 AND 434917;
DELETE FROM `gameobject_spawns` WHERE `id` BETWEEN 512830 AND 512888;

CREATE TABLE IF NOT EXISTS `active_event_id` (
  `active_event` int(10) unsigned NOT NULL,
  `name` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`active_event`)
);

DELETE FROM `active_event_id` WHERE `active_event`=42;
