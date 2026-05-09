import http from 'k6/http';
import { check } from 'k6';

export const options = {
    scenarios: {
        deadlock_demo: {
            executor: 'per-vu-iterations',
            vus: 10,
            iterations: 20,
            maxDuration: '60s',
        },
    },
};

const BASE_URL = __ENV.BENCH_BASE_URL || 'http://backend:8000';
const CLASS_A = __ENV.CLASS_A || 'HADONG_CS001';
const CLASS_B = __ENV.CLASS_B || 'HADONG_CS002';

export function setup() {
    const res1 = http.post(`${BASE_URL}/auth/login`, {
        username: __ENV.USER1 || 'SV001',
        password: __ENV.PASS1 || 'password',
        grant_type: 'password'
    }, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } });
    
    const res2 = http.post(`${BASE_URL}/auth/login`, {
        username: __ENV.USER2 || 'SV002',
        password: __ENV.PASS2 || 'password',
        grant_type: 'password'
    }, { headers: { 'Content-Type': 'application/x-www-form-urlencoded' } });

    return { token1: res1.json('access_token'), token2: res2.json('access_token') };
}

export default function (data) {
    let token = (__VU % 2 === 0) ? data.token1 : data.token2;
    let targetClass = (__ITER % 2 === 0) ? CLASS_B : CLASS_A;

    const headers = {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
    };

    const payload = JSON.stringify({
        MaLopHP: targetClass,
        GhiChu: "Demo Deadlock K6"
    });

    const res = http.post(`${BASE_URL}/enrollments/register`, payload, { headers });

    check(res, {
        'Status is 201 or 400 (if full)': (r) => r.status === 201 || r.status === 400,
    });
}
