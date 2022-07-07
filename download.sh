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
�+H�bdownload.sh �SAo�0>ǿ�V�8�i�ib�:4��
C;!T���XM�5qע�N$'.�qq@B�v��q;��^���{~���=n8m�8Y���Oc�3�;	q�m;�`0�m��>�x�ǧ'Nҏc��\����N(��)�J@���5��qz�b����������sl��	pj5��,'�'4��`���AS��'����Ac_����fy����ݺ��l�\�"Z� ��w��ϷLS2��D��i�ZG�F�Z�^���	��#�3գF�|��X3.)�i�>�ߗ���%2><z<g)�ǖY�9��U�/�Zv@��ؽW+#��)H�N#�C�T��ϑᑌ�Y<uG&���ޔ_c��,_1�F��@_�Z�,�؜�
�נb(oS��%�u�U�+繆�/�4#2��*��	EҤ5����ٓ����_��R�����%����JOA�)݃��U�Z̧l.7�I���R}�����Pfh� }U��!C�1�[�1=O��m��t��,P��cy��FKDT�~�������ӳ7����h�����ӗٷ	��-��  