#!/usr/bin/perl
use strict;
use warnings;

use Path::Tiny;
use autodie;

sub ltrim { my $s = shift; $s =~ s/^\s+//; return $s; };

my $iter = path(".")->iterator;
while (my $file = $iter->()) {
  # skip if it's a directory
  next if $file->is_dir();

  # we only want .html files
  next unless $file =~ /.html$/;

  my $file_handle = $file->openr_utf8();

  my $resfile = path("./_posts/$file");
  $resfile->remove;

  my $lineno = 0;
  while (my $line = $file_handle->getline()) {
    $lineno++;

    if ($line =~ /^[ \t]*!template (\w+\.html)$/) {
      print "line $lineno: " . ltrim($line);

      my $tfile = path("./_templates/$1");

      if ($tfile->exists()) {
        my $template = $tfile->openr_utf8();

        while (my $tln = $template->getline()) {
          $resfile->append_utf8($tln);
        }
      } else {
        print "line $lineno: template $1 not accounted for - check if missing";
      }
    } else {
      $resfile->append_utf8($line);
    }
  }
}
