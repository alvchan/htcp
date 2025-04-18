#!/usr/bin/perl
use strict;
use warnings;

sub ls {
  my $dirname = ".";
  if (scalar @_ > 0) {
    $dirname = shift @_;
  }

  opendir my $dir, $dirname or die "Can't open directory $dirname. Do you have read permissions?";
  my @files = readdir $dir;
  closedir $dir;

  return @files;
}

sub ltrim { my $s = shift; $s =~ s/^\s+//; return $s; };

my $dir = "_posts";
foreach my $file (ls $dir) {
  # skip if it's a directory
  next if -d $file or $file =~ /^\./;

  # we only want .html files
  next unless $file =~ /^(\w+\.html)$/;

  my $path = "$dir/$file";
  open my $fh, "<:encoding(UTF-8)", $path;

  # overwrite old output
  unlink $file if -e $file;
  open my $resfile, ">>:encoding(UTF-8)", $file;

  print "$file\n";

  my $lineno = 1;
  foreach my $line (<$fh>) {
    # find and replace '!template' with the actual snippet
    if ($line =~ /^\s*!template (\w+\.html)$/) {
      print "line $lineno: " . ltrim($line);

      open my $template_file, "<:encoding(UTF-8)", "_templates/$1"
        or die "[error] line $lineno: Can't open _templates/$1. Are you sure it exists?\n";

      my @template = <$template_file>;
      print $resfile @template;
    } else {
      print $resfile $line;
    }

    $lineno++;
  }
}
