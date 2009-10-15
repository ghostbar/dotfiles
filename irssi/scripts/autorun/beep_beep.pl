#!/usr/bin/irssi
#
# irssi beep replace script (tested with v0.8.4.CVS (20020413-1428))
# (C) 2002 Ge0rG@IRCnet (Georg Lukas <georg@op-co.de>)
# inspired and tested by Macrotron@IRCnet (macrotron@president.eu.org)

# added beep_flood to irssi settings: beep_cmd will be run not more often
# then every $beep_flood milliseconds

$VERSION = "0.8";
%IRSSI = (
    authors	=> "Georg Lukas",
    contact	=> "georg\@op-co.de",
    name	=> "beep_beep",
    description	=> "runs arbitrary command instead of system beep, includes flood protection",
    license	=> "Public Domain",
    url		=> "none",
);

use Irssi;

my $might_beep = 1;

sub beep_overflow_timeout() {
	$might_beep = 1;
}

sub beep_beep() {
	my $beep_cmd = Irssi::settings_get_str("beep_cmd");
	if ($beep_cmd) {
		my $beep_flood = Irssi::settings_get_int('beep_flood');
		$beep_flood = 1000 if $beep_flood < 0;
		Irssi::timeout_add_once($beep_flood, 'beep_overflow_timeout', undef);
		if ($might_beep) {
			system($beep_cmd);
			$might_beep = 0;
		}
		Irssi::signal_stop();
	}
}

Irssi::settings_add_str("lookandfeel", "beep_cmd", "play ~/.irssi/scripts/beep_beep.wav &");
Irssi::settings_add_int("lookandfeel", "beep_flood", 250);
Irssi::signal_add("beep", "beep_beep");

