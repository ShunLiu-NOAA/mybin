
tm='tm06 tm05 tm04 tm03 tm02 tm01 tm00'
for itm in $tm
do
  sed -e 's/900     /900 0000/' fv3lam.t12z.fits.$itm > $itm
  mv $itm fv3lam.t12z.fits.$itm
done

sed -e 's/900     /900 0000/' fv3lam.t12z.fits.tm06 > fit1
sed -e 's/   asm all/ps asm 999/; s/   rej all/ps rej 999/; s/   mon all/ps mon all/' fit_p1 > p1
sed -e 's/   asm all/t asm 999/; s/   rej all/t rej 999/; s/   mon all/t mon all/' fit_t1 > t1
sed -e 's/   asm all/uv asm 999/; s/   rej all/uv rej 999/; s/   mon all/uv mon all/' fit_w1 > w1
sed -e 's/   asm all/q asm 999/; s/   rej all/q rej 999/; s/   mon all/q mon all/' fit_q1 > q1
sed -e 's/   asm all/rw asm 999/; s/   rej all/rw rej 999/; s/   mon all/rw mon all/' fit_rw1 > rw1
sed -e 's/   asm all/pw asm 999/; s/   rej all/pw rej 999/; s/   mon all/pw mon all/' fit_rw1 > pw1
