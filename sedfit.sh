
sed -e 's/   asm all/ps asm 999/; s/   rej all/ps rej 999/; s/   mon all/ps mon all/' fit_p1 > p1
sed -e 's/   asm all/t asm 999/; s/   rej all/t rej 999/; s/   mon all/t mon all/' fit_t1 > t1
sed -e 's/   asm all/uv asm 999/; s/   rej all/uv rej 999/; s/   mon all/uv mon all/' fit_w1 > w1
sed -e 's/   asm all/q asm 999/; s/   rej all/q rej 999/; s/   mon all/q mon all/' fit_q1 > q1
sed -e 's/   asm all/rw asm 999/; s/   rej all/rw rej 999/; s/   mon all/rw mon all/' fit_rw1 > rw1
sed -e 's/   asm all/pw asm 999/; s/   rej all/pw rej 999/; s/   mon all/pw mon all/' fit_rw1 > pw1
