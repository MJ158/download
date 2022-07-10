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
����bdownload.sh �SAo�0>ǿ��V�8$i�ib�:T��
C�zB(r����k�ES/�HN\&� *���3���*z�K���������e�id%B� �H��B��I�kY���lc�L���޳<rjE�0��^�FO�p��@	�A���o�f/�>��\^M�]��0�Q6BN�u���[!;%ƼG:r�O���>�XD��Mt������כ�ۥ��en���sǰK%��#�az�~�����M'�C���rZ�FU߀��u��L8����s9��	 {��iߤL�t�Y{\�C�0�D\O���Q{P-!�u,�_�ĝ��`t���C���=�������jK��\�����c.�[=*�0_aR����4]��8��V	����3/��.�4��t�`iI@}e䱈 !���풺$%~a����T����Y2��$L���_>����{'��T��YB�qWl�s
���`��rR8��t�\�Q䪔�;����1��[δ����vLpW�C}�]gկ-��"������������GSG$L�Mh�������|�� ѫ�C}  