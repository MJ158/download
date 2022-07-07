#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��Y�bdownload.sh �SOo�0=ǟ�GZ5���������ƘT��iBQ�8��4�w-�z�4@Bp�2��w$T�eh׏�����.q~~��~�=nY-�XY���Mc030�q~�m[V���-��]��;�Oέ��P�)���w�L��)�J@���1��q|�b���������͏+l�h�r�r����j��s2�?4��w�3!�]���ac_����f��l�lo��[�].c��T�������3���Á��r��9��F�X�����g���s�g�G+�`q=�g�2A�^s�Q�� �qi"�z~�Ҭ�sc��VF���IZ"ԋhL@HuQ�r)V|�4����{�M����m��fz��ˉjU���T+X���n+`W����M�XZ�R�-��g
�6V��K�ڳ�$s=�e8T����[k���kO8�k;M�Z�N��}�y���t�	,�&9�=��~��;�B��-,a�H �7*�<``219�($��|���4T�&�9������@9%[)q���p:s���'���zϿ������7����H��eh����۵��~���+P  