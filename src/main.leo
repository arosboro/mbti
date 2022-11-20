// The 'mbti' program.
program mbti.aleo {

    // Up to 32 u8 (chars) per term.  Each term is a 32 character string.
    struct Term {
        t0: u8,
        t1: u8,
        t2: u8,
        t3: u8,
        t4: u8,
        t5: u8,
        t6: u8,
        t7: u8,
        t8: u8,
        t9: u8,
        t10: u8,
        t11: u8,
        t12: u8,
        t13: u8,
        t14: u8,
        t15: u8,
        t16: u8,
        t17: u8,
        t18: u8,
        t19: u8,
        t20: u8,
        t21: u8,
        t22: u8,
        t23: u8,
        t24: u8,
        t25: u8,
        t26: u8,
        t27: u8,
        t28: u8,
        t29: u8,
        t30: u8,
        t31: u8,
    }

    // The frequencies associated with a dictionary term.
    struct TermFrequency {
        term: Term,
        overall_frequency: u128,
        enfj_frequency: u128,
        enfp_frequency: u128,
        entj_frequency: u128,
        entp_frequency: u128,
        esfj_frequency: u128,
        esfp_frequency: u128,
        estj_frequency: u128,
        estp_frequency: u128,
        infj_frequency: u128,
        infp_frequency: u128,
        intj_frequency: u128,
        intp_frequency: u128,
        isfj_frequency: u128,
        isfp_frequency: u128,
        istj_frequency: u128,
        istp_frequency: u128,
    }

    // Up to 32 terms per post.  Each term is a 32 character string.
    struct Post {
        t0: Term,
        t1: Term,
        t2: Term,
        t3: Term,
        t4: Term,
        t5: Term,
        t6: Term,
        t7: Term,
        t8: Term,
        t9: Term,
        t10: Term,
        t11: Term,
        t12: Term,
        t13: Term,
        t14: Term,
        t15: Term,
        t16: Term,
        t17: Term,
        t18: Term,
        t19: Term,
        t20: Term,
        t21: Term,
        t22: Term,
        t23: Term,
        t24: Term,
        t25: Term,
        t26: Term,
        t27: Term,
        t28: Term,
        t29: Term,
        t30: Term,
        t31: Term,
    }

    // Up to 30 terms per post.  Each term is a 42 character string. 0-499.
    struct PostFrequency {
        t0: u128,
        t1: u128,
        t2: u128,
        t3: u128,
        t4: u128,
        t5: u128,
        t6: u128,
        t7: u128,
        t8: u128,
        t9: u128,
        t10: u128,
        t11: u128,
        t12: u128,
        t13: u128,
        t14: u128,
        t15: u128,
        t16: u128,
        t17: u128,
        t18: u128,
        t19: u128,
        t20: u128,
        t21: u128,
        t22: u128,
        t23: u128,
        t24: u128,
        t25: u128,
        t26: u128,
        t27: u128,
        t28: u128,
        t29: u128,
        t30: u128,
        t31: u128,
    }

    // A dictionary mapping strings to TermFrequencies.
    mapping overall_frequency: Term => u128;
    mapping enfj_frequency: Term => u128;
    mapping enfp_frequency: Term => u128;
    mapping entj_frequency: Term => u128;
    mapping entp_frequency: Term => u128;
    mapping esfj_frequency: Term => u128;
    mapping esfp_frequency: Term => u128;
    mapping estj_frequency: Term => u128;
    mapping estp_frequency: Term => u128;
    mapping infj_frequency: Term => u128;
    mapping infp_frequency: Term => u128;
    mapping intj_frequency: Term => u128;
    mapping intp_frequency: Term => u128;
    mapping isfj_frequency: Term => u128;
    mapping isfp_frequency: Term => u128;
    mapping istj_frequency: Term => u128;
    mapping istp_frequency: Term => u128;

    record PostStatistics {
        owner: address,
        gates: u64,
        post: Post,
        overall_frequency: PostFrequency,
        enfj_frequency: PostFrequency,
        enfp_frequency: PostFrequency,
        entj_frequency: PostFrequency,
        entp_frequency: PostFrequency,
        esfj_frequency: PostFrequency,
        esfp_frequency: PostFrequency,
        estj_frequency: PostFrequency,
        estp_frequency: PostFrequency,
        infj_frequency: PostFrequency,
        infp_frequency: PostFrequency,
        intj_frequency: PostFrequency,
        intp_frequency: PostFrequency,
        isfj_frequency: PostFrequency,
        isfp_frequency: PostFrequency,
        istj_frequency: PostFrequency,
        istp_frequency: PostFrequency,
    }

    function label_flagged_i(type_indicator: u8) -> bool {
        const I: u8 = 128u8;
        let i: bool = false;
        if (type_indicator & I) == I {
            i = true;
        }
        return i;
    }

    function label_flagged_e(type_indicator: u8) -> bool {
        const E: u8 = 64u8;
        let e: bool = false;
        if (type_indicator & E) == E {
            e = true;
        }
        return e;
    }

    function label_flagged_s(type_indicator: u8) -> bool {
        const S: u8 = 32u8;
        let s: bool = false;
        if (type_indicator & S) == S {
            s = true;
        }
        return s;
    }

    function label_flagged_n(type_indicator: u8) -> bool {
        const N: u8 = 16u8;
        let n: bool = false;
        if (type_indicator & N) == N {
            n = true;
        }
        return n;
    }

    function label_flagged_t(type_indicator: u8) -> bool {
        const T: u8 = 8u8;
        let t: bool = false;
        if (type_indicator & T) == T {
            t = true;
        }
        return t;
    }

    function label_flagged_f(type_indicator: u8) -> bool {
        const F: u8 = 4u8;
        let f: bool = false;
        if (type_indicator & F) == F {
            f = true;
        }
        return f;
    }

    function label_flagged_j(type_indicator: u8) -> bool {
        const J: u8 = 2u8;
        let j: bool = false;
        if (type_indicator & J) == J {
            j = true;
        }
        return j;
    }

    function label_flagged_p(type_indicator: u8) -> bool {
        const P: u8 = 1u8;
        let p: bool = false;
        if (type_indicator & P) == P {
            p = true;
        }
        return p;
    }

    transition train(label: u8, post: Post) {
        // Increment the mappings for each term in the post.
        let i: bool = label_flagged_i(label);
        let e: bool = label_flagged_e(label);
        let s: bool = label_flagged_s(label);
        let n: bool = label_flagged_n(label);
        let t: bool = label_flagged_t(label);
        let f: bool = label_flagged_f(label);
        let j: bool = label_flagged_j(label);
        let p: bool = label_flagged_p(label);
        let enfj: u128 = e && n && f && j ? 1u128 : 0u128;
        let enfp: u128 = e && n && f && p ? 1u128 : 0u128;
        let entj: u128 = e && n && t && j ? 1u128 : 0u128;
        let entp: u128 = e && n && t && p ? 1u128 : 0u128;
        let esfj: u128 = e && s && f && j ? 1u128 : 0u128;
        let esfp: u128 = e && s && f && p ? 1u128 : 0u128;
        let estj: u128 = e && s && t && j ? 1u128 : 0u128;
        let estp: u128 = e && s && t && p ? 1u128 : 0u128;
        let infj: u128 = i && n && f && j ? 1u128 : 0u128;
        let infp: u128 = i && n && f && p ? 1u128 : 0u128;
        let intj: u128 = i && n && t && j ? 1u128 : 0u128;
        let intp: u128 = i && n && t && p ? 1u128 : 0u128;
        let isfj: u128 = i && s && f && j ? 1u128 : 0u128;
        let isfp: u128 = i && s && f && p ? 1u128 : 0u128;
        let istj: u128 = i && s && t && j ? 1u128 : 0u128;
        let istp: u128 = i && s && t && p ? 1u128 : 0u128;
        async finalize(post,
            enfj, enfp, entj, entp, esfj, esfp, estj, estp, infj, infp, intj, intp, isfj, isfp, istj, istp);
    }

    finalize train(post: Post,
                   enfj: u128, enfp: u128, entj: u128, entp: u128, esfj: u128, esfp: u128, estj: u128, estp: u128,
                   infj: u128, infp: u128, intj: u128, intp: u128, isfj: u128, isfp: u128, istj: u128, istp: u128) {
        // Increment the mappings for each term t0 through t31 in the post.
        increment(overall_frequency, post.t0, 1u128);
        increment(enfj_frequency, post.t0, enfj);
        increment(enfp_frequency, post.t0, enfp);
        increment(entj_frequency, post.t0, entj);
        increment(entp_frequency, post.t0, entp);
        increment(esfj_frequency, post.t0, esfj);
        increment(esfp_frequency, post.t0, esfp);
        increment(estj_frequency, post.t0, estj);
        increment(estp_frequency, post.t0, estp);
        increment(infj_frequency, post.t0, infj);
        increment(infp_frequency, post.t0, infp);
        increment(intj_frequency, post.t0, intj);
        increment(intp_frequency, post.t0, intp);
        increment(isfj_frequency, post.t0, isfj);
        increment(isfp_frequency, post.t0, isfp);
        increment(istj_frequency, post.t0, istj);
        increment(istp_frequency, post.t0, istp);
        increment(overall_frequency, post.t1, 1u128);
        increment(enfj_frequency, post.t1, enfj);
        increment(enfp_frequency, post.t1, enfp);
        increment(entj_frequency, post.t1, entj);
        increment(entp_frequency, post.t1, entp);
        increment(esfj_frequency, post.t1, esfj);
        increment(esfp_frequency, post.t1, esfp);
        increment(estj_frequency, post.t1, estj);
        increment(estp_frequency, post.t1, estp);
        increment(infj_frequency, post.t1, infj);
        increment(infp_frequency, post.t1, infp);
        increment(intj_frequency, post.t1, intj);
        increment(intp_frequency, post.t1, intp);
        increment(isfj_frequency, post.t1, isfj);
        increment(isfp_frequency, post.t1, isfp);
        increment(istj_frequency, post.t1, istj);
        increment(istp_frequency, post.t1, istp);
        increment(overall_frequency, post.t2, 1u128);
        increment(enfj_frequency, post.t2, enfj);
        increment(enfp_frequency, post.t2, enfp);
        increment(entj_frequency, post.t2, entj);
        increment(entp_frequency, post.t2, entp);
        increment(esfj_frequency, post.t2, esfj);
        increment(esfp_frequency, post.t2, esfp);
        increment(estj_frequency, post.t2, estj);
        increment(estp_frequency, post.t2, estp);
        increment(infj_frequency, post.t2, infj);
        increment(infp_frequency, post.t2, infp);
        increment(intj_frequency, post.t2, intj);
        increment(intp_frequency, post.t2, intp);
        increment(isfj_frequency, post.t2, isfj);
        increment(isfp_frequency, post.t2, isfp);
        increment(istj_frequency, post.t2, istj);
        increment(istp_frequency, post.t2, istp);
        increment(overall_frequency, post.t3, 1u128);
        increment(enfj_frequency, post.t3, enfj);
        increment(enfp_frequency, post.t3, enfp);
        increment(entj_frequency, post.t3, entj);
        increment(entp_frequency, post.t3, entp);
        increment(esfj_frequency, post.t3, esfj);
        increment(esfp_frequency, post.t3, esfp);
        increment(estj_frequency, post.t3, estj);
        increment(estp_frequency, post.t3, estp);
        increment(infj_frequency, post.t3, infj);
        increment(infp_frequency, post.t3, infp);
        increment(intj_frequency, post.t3, intj);
        increment(intp_frequency, post.t3, intp);
        increment(isfj_frequency, post.t3, isfj);
        increment(isfp_frequency, post.t3, isfp);
        increment(istj_frequency, post.t3, istj);
        increment(istp_frequency, post.t3, istp);
        increment(overall_frequency, post.t4, 1u128);
        increment(enfj_frequency, post.t4, enfj);
        increment(enfp_frequency, post.t4, enfp);
        increment(entj_frequency, post.t4, entj);
        increment(entp_frequency, post.t4, entp);
        increment(esfj_frequency, post.t4, esfj);
        increment(esfp_frequency, post.t4, esfp);
        increment(estj_frequency, post.t4, estj);
        increment(estp_frequency, post.t4, estp);
        increment(infj_frequency, post.t4, infj);
        increment(infp_frequency, post.t4, infp);
        increment(intj_frequency, post.t4, intj);
        increment(intp_frequency, post.t4, intp);
        increment(isfj_frequency, post.t4, isfj);
        increment(isfp_frequency, post.t4, isfp);
        increment(istj_frequency, post.t4, istj);
        increment(istp_frequency, post.t4, istp);
        increment(overall_frequency, post.t5, 1u128);
        increment(enfj_frequency, post.t5, enfj);
        increment(enfp_frequency, post.t5, enfp);
        increment(entj_frequency, post.t5, entj);
        increment(entp_frequency, post.t5, entp);
        increment(esfj_frequency, post.t5, esfj);
        increment(esfp_frequency, post.t5, esfp);
        increment(estj_frequency, post.t5, estj);
        increment(estp_frequency, post.t5, estp);
        increment(infj_frequency, post.t5, infj);
        increment(infp_frequency, post.t5, infp);
        increment(intj_frequency, post.t5, intj);
        increment(intp_frequency, post.t5, intp);
        increment(isfj_frequency, post.t5, isfj);
        increment(isfp_frequency, post.t5, isfp);
        increment(istj_frequency, post.t5, istj);
        increment(istp_frequency, post.t5, istp);
        increment(overall_frequency, post.t6, 1u128);
        increment(enfj_frequency, post.t6, enfj);
        increment(enfp_frequency, post.t6, enfp);
        increment(entj_frequency, post.t6, entj);
        increment(entp_frequency, post.t6, entp);
        increment(esfj_frequency, post.t6, esfj);
        increment(esfp_frequency, post.t6, esfp);
        increment(estj_frequency, post.t6, estj);
        increment(estp_frequency, post.t6, estp);
        increment(infj_frequency, post.t6, infj);
        increment(infp_frequency, post.t6, infp);
        increment(intj_frequency, post.t6, intj);
        increment(intp_frequency, post.t6, intp);
        increment(isfj_frequency, post.t6, isfj);
        increment(isfp_frequency, post.t6, isfp);
        increment(istj_frequency, post.t6, istj);
        increment(istp_frequency, post.t6, istp);
        increment(overall_frequency, post.t7, 1u128);
        increment(enfj_frequency, post.t7, enfj);
        increment(enfp_frequency, post.t7, enfp);
        increment(entj_frequency, post.t7, entj);
        increment(entp_frequency, post.t7, entp);
        increment(esfj_frequency, post.t7, esfj);
        increment(esfp_frequency, post.t7, esfp);
        increment(estj_frequency, post.t7, estj);
        increment(estp_frequency, post.t7, estp);
        increment(infj_frequency, post.t7, infj);
        increment(infp_frequency, post.t7, infp);
        increment(intj_frequency, post.t7, intj);
        increment(intp_frequency, post.t7, intp);
        increment(isfj_frequency, post.t7, isfj);
        increment(isfp_frequency, post.t7, isfp);
        increment(istj_frequency, post.t7, istj);
        increment(istp_frequency, post.t7, istp);
        increment(overall_frequency, post.t8, 1u128);
        increment(enfj_frequency, post.t8, enfj);
        increment(enfp_frequency, post.t8, enfp);
        increment(entj_frequency, post.t8, entj);
        increment(entp_frequency, post.t8, entp);
        increment(esfj_frequency, post.t8, esfj);
        increment(esfp_frequency, post.t8, esfp);
        increment(estj_frequency, post.t8, estj);
        increment(estp_frequency, post.t8, estp);
        increment(infj_frequency, post.t8, infj);
        increment(infp_frequency, post.t8, infp);
        increment(intj_frequency, post.t8, intj);
        increment(intp_frequency, post.t8, intp);
        increment(isfj_frequency, post.t8, isfj);
        increment(isfp_frequency, post.t8, isfp);
        increment(istj_frequency, post.t8, istj);
        increment(istp_frequency, post.t8, istp);
        increment(overall_frequency, post.t9, 1u128);
        increment(enfj_frequency, post.t9, enfj);
        increment(enfp_frequency, post.t9, enfp);
        increment(entj_frequency, post.t9, entj);
        increment(entp_frequency, post.t9, entp);
        increment(esfj_frequency, post.t9, esfj);
        increment(esfp_frequency, post.t9, esfp);
        increment(estj_frequency, post.t9, estj);
        increment(estp_frequency, post.t9, estp);
        increment(infj_frequency, post.t9, infj);
        increment(infp_frequency, post.t9, infp);
        increment(intj_frequency, post.t9, intj);
        increment(intp_frequency, post.t9, intp);
        increment(isfj_frequency, post.t9, isfj);
        increment(isfp_frequency, post.t9, isfp);
        increment(istj_frequency, post.t9, istj);
        increment(istp_frequency, post.t9, istp);
        increment(overall_frequency, post.t10, 1u128);
        increment(enfj_frequency, post.t10, enfj);
        increment(enfp_frequency, post.t10, enfp);
        increment(entj_frequency, post.t10, entj);
        increment(entp_frequency, post.t10, entp);
        increment(esfj_frequency, post.t10, esfj);
        increment(esfp_frequency, post.t10, esfp);
        increment(estj_frequency, post.t10, estj);
        increment(estp_frequency, post.t10, estp);
        increment(infj_frequency, post.t10, infj);
        increment(infp_frequency, post.t10, infp);
        increment(intj_frequency, post.t10, intj);
        increment(intp_frequency, post.t10, intp);
        increment(isfj_frequency, post.t10, isfj);
        increment(isfp_frequency, post.t10, isfp);
        increment(istj_frequency, post.t10, istj);
        increment(istp_frequency, post.t10, istp);
        increment(overall_frequency, post.t11, 1u128);
        increment(enfj_frequency, post.t11, enfj);
        increment(enfp_frequency, post.t11, enfp);
        increment(entj_frequency, post.t11, entj);
        increment(entp_frequency, post.t11, entp);
        increment(esfj_frequency, post.t11, esfj);
        increment(esfp_frequency, post.t11, esfp);
        increment(estj_frequency, post.t11, estj);
        increment(estp_frequency, post.t11, estp);
        increment(infj_frequency, post.t11, infj);
        increment(infp_frequency, post.t11, infp);
        increment(intj_frequency, post.t11, intj);
        increment(intp_frequency, post.t11, intp);
        increment(isfj_frequency, post.t11, isfj);
        increment(isfp_frequency, post.t11, isfp);
        increment(istj_frequency, post.t11, istj);
        increment(istp_frequency, post.t11, istp);
        increment(overall_frequency, post.t12, 1u128);
        increment(enfj_frequency, post.t12, enfj);
        increment(enfp_frequency, post.t12, enfp);
        increment(entj_frequency, post.t12, entj);
        increment(entp_frequency, post.t12, entp);
        increment(esfj_frequency, post.t12, esfj);
        increment(esfp_frequency, post.t12, esfp);
        increment(estj_frequency, post.t12, estj);
        increment(estp_frequency, post.t12, estp);
        increment(infj_frequency, post.t12, infj);
        increment(infp_frequency, post.t12, infp);
        increment(intj_frequency, post.t12, intj);
        increment(intp_frequency, post.t12, intp);
        increment(isfj_frequency, post.t12, isfj);
        increment(isfp_frequency, post.t12, isfp);
        increment(istj_frequency, post.t12, istj);
        increment(istp_frequency, post.t12, istp);
        increment(overall_frequency, post.t13, 1u128);
        increment(enfj_frequency, post.t13, enfj);
        increment(enfp_frequency, post.t13, enfp);
        increment(entj_frequency, post.t13, entj);
        increment(entp_frequency, post.t13, entp);
        increment(esfj_frequency, post.t13, esfj);
        increment(esfp_frequency, post.t13, esfp);
        increment(estj_frequency, post.t13, estj);
        increment(estp_frequency, post.t13, estp);
        increment(infj_frequency, post.t13, infj);
        increment(infp_frequency, post.t13, infp);
        increment(intj_frequency, post.t13, intj);
        increment(intp_frequency, post.t13, intp);
        increment(isfj_frequency, post.t13, isfj);
        increment(isfp_frequency, post.t13, isfp);
        increment(istj_frequency, post.t13, istj);
        increment(istp_frequency, post.t13, istp);
        increment(overall_frequency, post.t14, 1u128);
        increment(enfj_frequency, post.t14, enfj);
        increment(enfp_frequency, post.t14, enfp);
        increment(entj_frequency, post.t14, entj);
        increment(entp_frequency, post.t14, entp);
        increment(esfj_frequency, post.t14, esfj);
        increment(esfp_frequency, post.t14, esfp);
        increment(estj_frequency, post.t14, estj);
        increment(estp_frequency, post.t14, estp);
        increment(infj_frequency, post.t14, infj);
        increment(infp_frequency, post.t14, infp);
        increment(intj_frequency, post.t14, intj);
        increment(intp_frequency, post.t14, intp);
        increment(isfj_frequency, post.t14, isfj);
        increment(isfp_frequency, post.t14, isfp);
        increment(istj_frequency, post.t14, istj);
        increment(istp_frequency, post.t14, istp);
        increment(overall_frequency, post.t15, 1u128);
        increment(enfj_frequency, post.t15, enfj);
        increment(enfp_frequency, post.t15, enfp);
        increment(entj_frequency, post.t15, entj);
        increment(entp_frequency, post.t15, entp);
        increment(esfj_frequency, post.t15, esfj);
        increment(esfp_frequency, post.t15, esfp);
        increment(estj_frequency, post.t15, estj);
        increment(estp_frequency, post.t15, estp);
        increment(infj_frequency, post.t15, infj);
        increment(infp_frequency, post.t15, infp);
        increment(intj_frequency, post.t15, intj);
        increment(intp_frequency, post.t15, intp);
        increment(isfj_frequency, post.t15, isfj);
        increment(isfp_frequency, post.t15, isfp);
        increment(istj_frequency, post.t15, istj);
        increment(istp_frequency, post.t15, istp);
        increment(overall_frequency, post.t16, 1u128);
        increment(enfj_frequency, post.t16, enfj);
        increment(enfp_frequency, post.t16, enfp);
        increment(entj_frequency, post.t16, entj);
        increment(entp_frequency, post.t16, entp);
        increment(esfj_frequency, post.t16, esfj);
        increment(esfp_frequency, post.t16, esfp);
        increment(estj_frequency, post.t16, estj);
        increment(estp_frequency, post.t16, estp);
        increment(infj_frequency, post.t16, infj);
        increment(infp_frequency, post.t16, infp);
        increment(intj_frequency, post.t16, intj);
        increment(intp_frequency, post.t16, intp);
        increment(isfj_frequency, post.t16, isfj);
        increment(isfp_frequency, post.t16, isfp);
        increment(istj_frequency, post.t16, istj);
        increment(istp_frequency, post.t16, istp);
        increment(overall_frequency, post.t17, 1u128);
        increment(enfj_frequency, post.t17, enfj);
        increment(enfp_frequency, post.t17, enfp);
        increment(entj_frequency, post.t17, entj);
        increment(entp_frequency, post.t17, entp);
        increment(esfj_frequency, post.t17, esfj);
        increment(esfp_frequency, post.t17, esfp);
        increment(estj_frequency, post.t17, estj);
        increment(estp_frequency, post.t17, estp);
        increment(infj_frequency, post.t17, infj);
        increment(infp_frequency, post.t17, infp);
        increment(intj_frequency, post.t17, intj);
        increment(intp_frequency, post.t17, intp);
        increment(isfj_frequency, post.t17, isfj);
        increment(isfp_frequency, post.t17, isfp);
        increment(istj_frequency, post.t17, istj);
        increment(istp_frequency, post.t17, istp);
        increment(overall_frequency, post.t18, 1u128);
        increment(enfj_frequency, post.t18, enfj);
        increment(enfp_frequency, post.t18, enfp);
        increment(entj_frequency, post.t18, entj);
        increment(entp_frequency, post.t18, entp);
        increment(esfj_frequency, post.t18, esfj);
        increment(esfp_frequency, post.t18, esfp);
        increment(estj_frequency, post.t18, estj);
        increment(estp_frequency, post.t18, estp);
        increment(infj_frequency, post.t18, infj);
        increment(infp_frequency, post.t18, infp);
        increment(intj_frequency, post.t18, intj);
        increment(intp_frequency, post.t18, intp);
        increment(isfj_frequency, post.t18, isfj);
        increment(isfp_frequency, post.t18, isfp);
        increment(istj_frequency, post.t18, istj);
        increment(istp_frequency, post.t18, istp);
        increment(overall_frequency, post.t19, 1u128);
        increment(enfj_frequency, post.t19, enfj);
        increment(enfp_frequency, post.t19, enfp);
        increment(entj_frequency, post.t19, entj);
        increment(entp_frequency, post.t19, entp);
        increment(esfj_frequency, post.t19, esfj);
        increment(esfp_frequency, post.t19, esfp);
        increment(estj_frequency, post.t19, estj);
        increment(estp_frequency, post.t19, estp);
        increment(infj_frequency, post.t19, infj);
        increment(infp_frequency, post.t19, infp);
        increment(intj_frequency, post.t19, intj);
        increment(intp_frequency, post.t19, intp);
        increment(isfj_frequency, post.t19, isfj);
        increment(isfp_frequency, post.t19, isfp);
        increment(istj_frequency, post.t19, istj);
        increment(istp_frequency, post.t19, istp);
        increment(overall_frequency, post.t20, 1u128);
        increment(enfj_frequency, post.t20, enfj);
        increment(enfp_frequency, post.t20, enfp);
        increment(entj_frequency, post.t20, entj);
        increment(entp_frequency, post.t20, entp);
        increment(esfj_frequency, post.t20, esfj);
        increment(esfp_frequency, post.t20, esfp);
        increment(estj_frequency, post.t20, estj);
        increment(estp_frequency, post.t20, estp);
        increment(infj_frequency, post.t20, infj);
        increment(infp_frequency, post.t20, infp);
        increment(intj_frequency, post.t20, intj);
        increment(intp_frequency, post.t20, intp);
        increment(isfj_frequency, post.t20, isfj);
        increment(isfp_frequency, post.t20, isfp);
        increment(istj_frequency, post.t20, istj);
        increment(istp_frequency, post.t20, istp);
        increment(overall_frequency, post.t21, 1u128);
        increment(enfj_frequency, post.t21, enfj);
        increment(enfp_frequency, post.t21, enfp);
        increment(entj_frequency, post.t21, entj);
        increment(entp_frequency, post.t21, entp);
        increment(esfj_frequency, post.t21, esfj);
        increment(esfp_frequency, post.t21, esfp);
        increment(estj_frequency, post.t21, estj);
        increment(estp_frequency, post.t21, estp);
        increment(infj_frequency, post.t21, infj);
        increment(infp_frequency, post.t21, infp);
        increment(intj_frequency, post.t21, intj);
        increment(intp_frequency, post.t21, intp);
        increment(isfj_frequency, post.t21, isfj);
        increment(isfp_frequency, post.t21, isfp);
        increment(istj_frequency, post.t21, istj);
        increment(istp_frequency, post.t21, istp);
        increment(overall_frequency, post.t22, 1u128);
        increment(enfj_frequency, post.t22, enfj);
        increment(enfp_frequency, post.t22, enfp);
        increment(entj_frequency, post.t22, entj);
        increment(entp_frequency, post.t22, entp);
        increment(esfj_frequency, post.t22, esfj);
        increment(esfp_frequency, post.t22, esfp);
        increment(estj_frequency, post.t22, estj);
        increment(estp_frequency, post.t22, estp);
        increment(infj_frequency, post.t22, infj);
        increment(infp_frequency, post.t22, infp);
        increment(intj_frequency, post.t22, intj);
        increment(intp_frequency, post.t22, intp);
        increment(isfj_frequency, post.t22, isfj);
        increment(isfp_frequency, post.t22, isfp);
        increment(istj_frequency, post.t22, istj);
        increment(istp_frequency, post.t22, istp);
        increment(overall_frequency, post.t23, 1u128);
        increment(enfj_frequency, post.t23, enfj);
        increment(enfp_frequency, post.t23, enfp);
        increment(entj_frequency, post.t23, entj);
        increment(entp_frequency, post.t23, entp);
        increment(esfj_frequency, post.t23, esfj);
        increment(esfp_frequency, post.t23, esfp);
        increment(estj_frequency, post.t23, estj);
        increment(estp_frequency, post.t23, estp);
        increment(infj_frequency, post.t23, infj);
        increment(infp_frequency, post.t23, infp);
        increment(intj_frequency, post.t23, intj);
        increment(intp_frequency, post.t23, intp);
        increment(isfj_frequency, post.t23, isfj);
        increment(isfp_frequency, post.t23, isfp);
        increment(istj_frequency, post.t23, istj);
        increment(istp_frequency, post.t23, istp);
        increment(overall_frequency, post.t24, 1u128);
        increment(enfj_frequency, post.t24, enfj);
        increment(enfp_frequency, post.t24, enfp);
        increment(entj_frequency, post.t24, entj);
        increment(entp_frequency, post.t24, entp);
        increment(esfj_frequency, post.t24, esfj);
        increment(esfp_frequency, post.t24, esfp);
        increment(estj_frequency, post.t24, estj);
        increment(estp_frequency, post.t24, estp);
        increment(infj_frequency, post.t24, infj);
        increment(infp_frequency, post.t24, infp);
        increment(intj_frequency, post.t24, intj);
        increment(intp_frequency, post.t24, intp);
        increment(isfj_frequency, post.t24, isfj);
        increment(isfp_frequency, post.t24, isfp);
        increment(istj_frequency, post.t24, istj);
        increment(istp_frequency, post.t24, istp);
        increment(overall_frequency, post.t25, 1u128);
        increment(enfj_frequency, post.t25, enfj);
        increment(enfp_frequency, post.t25, enfp);
        increment(entj_frequency, post.t25, entj);
        increment(entp_frequency, post.t25, entp);
        increment(esfj_frequency, post.t25, esfj);
        increment(esfp_frequency, post.t25, esfp);
        increment(estj_frequency, post.t25, estj);
        increment(estp_frequency, post.t25, estp);
        increment(infj_frequency, post.t25, infj);
        increment(infp_frequency, post.t25, infp);
        increment(intj_frequency, post.t25, intj);
        increment(intp_frequency, post.t25, intp);
        increment(isfj_frequency, post.t25, isfj);
        increment(isfp_frequency, post.t25, isfp);
        increment(istj_frequency, post.t25, istj);
        increment(istp_frequency, post.t25, istp);
        increment(overall_frequency, post.t26, 1u128);
        increment(enfj_frequency, post.t26, enfj);
        increment(enfp_frequency, post.t26, enfp);
        increment(entj_frequency, post.t26, entj);
        increment(entp_frequency, post.t26, entp);
        increment(esfj_frequency, post.t26, esfj);
        increment(esfp_frequency, post.t26, esfp);
        increment(estj_frequency, post.t26, estj);
        increment(estp_frequency, post.t26, estp);
        increment(infj_frequency, post.t26, infj);
        increment(infp_frequency, post.t26, infp);
        increment(intj_frequency, post.t26, intj);
        increment(intp_frequency, post.t26, intp);
        increment(isfj_frequency, post.t26, isfj);
        increment(isfp_frequency, post.t26, isfp);
        increment(istj_frequency, post.t26, istj);
        increment(istp_frequency, post.t26, istp);
        increment(overall_frequency, post.t27, 1u128);
        increment(enfj_frequency, post.t27, enfj);
        increment(enfp_frequency, post.t27, enfp);
        increment(entj_frequency, post.t27, entj);
        increment(entp_frequency, post.t27, entp);
        increment(esfj_frequency, post.t27, esfj);
        increment(esfp_frequency, post.t27, esfp);
        increment(estj_frequency, post.t27, estj);
        increment(estp_frequency, post.t27, estp);
        increment(infj_frequency, post.t27, infj);
        increment(infp_frequency, post.t27, infp);
        increment(intj_frequency, post.t27, intj);
        increment(intp_frequency, post.t27, intp);
        increment(isfj_frequency, post.t27, isfj);
        increment(isfp_frequency, post.t27, isfp);
        increment(istj_frequency, post.t27, istj);
        increment(istp_frequency, post.t27, istp);
        increment(overall_frequency, post.t28, 1u128);
        increment(enfj_frequency, post.t28, enfj);
        increment(enfp_frequency, post.t28, enfp);
        increment(entj_frequency, post.t28, entj);
        increment(entp_frequency, post.t28, entp);
        increment(esfj_frequency, post.t28, esfj);
        increment(esfp_frequency, post.t28, esfp);
        increment(estj_frequency, post.t28, estj);
        increment(estp_frequency, post.t28, estp);
        increment(infj_frequency, post.t28, infj);
        increment(infp_frequency, post.t28, infp);
        increment(intj_frequency, post.t28, intj);
        increment(intp_frequency, post.t28, intp);
        increment(isfj_frequency, post.t28, isfj);
        increment(isfp_frequency, post.t28, isfp);
        increment(istj_frequency, post.t28, istj);
        increment(istp_frequency, post.t28, istp);
        increment(overall_frequency, post.t29, 1u128);
        increment(enfj_frequency, post.t29, enfj);
        increment(enfp_frequency, post.t29, enfp);
        increment(entj_frequency, post.t29, entj);
        increment(entp_frequency, post.t29, entp);
        increment(esfj_frequency, post.t29, esfj);
        increment(esfp_frequency, post.t29, esfp);
        increment(estj_frequency, post.t29, estj);
        increment(estp_frequency, post.t29, estp);
        increment(infj_frequency, post.t29, infj);
        increment(infp_frequency, post.t29, infp);
        increment(intj_frequency, post.t29, intj);
        increment(intp_frequency, post.t29, intp);
        increment(isfj_frequency, post.t29, isfj);
        increment(isfp_frequency, post.t29, isfp);
        increment(istj_frequency, post.t29, istj);
        increment(istp_frequency, post.t29, istp);
        increment(overall_frequency, post.t30, 1u128);
        increment(enfj_frequency, post.t30, enfj);
        increment(enfp_frequency, post.t30, enfp);
        increment(entj_frequency, post.t30, entj);
        increment(entp_frequency, post.t30, entp);
        increment(esfj_frequency, post.t30, esfj);
        increment(esfp_frequency, post.t30, esfp);
        increment(estj_frequency, post.t30, estj);
        increment(estp_frequency, post.t30, estp);
        increment(infj_frequency, post.t30, infj);
        increment(infp_frequency, post.t30, infp);
        increment(intj_frequency, post.t30, intj);
        increment(intp_frequency, post.t30, intp);
        increment(isfj_frequency, post.t30, isfj);
        increment(isfp_frequency, post.t30, isfp);
        increment(istj_frequency, post.t30, istj);
        increment(istp_frequency, post.t30, istp);
        increment(overall_frequency, post.t31, 1u128);
        increment(enfj_frequency, post.t31, enfj);
        increment(enfp_frequency, post.t31, enfp);
        increment(entj_frequency, post.t31, entj);
        increment(entp_frequency, post.t31, entp);
        increment(esfj_frequency, post.t31, esfj);
        increment(esfp_frequency, post.t31, esfp);
        increment(estj_frequency, post.t31, estj);
        increment(estp_frequency, post.t31, estp);
        increment(infj_frequency, post.t31, infj);
        increment(infp_frequency, post.t31, infp);
        increment(intj_frequency, post.t31, intj);
        increment(intp_frequency, post.t31, intp);
        increment(isfj_frequency, post.t31, isfj);
        increment(isfp_frequency, post.t31, isfp);
        increment(istj_frequency, post.t31, istj);
        increment(istp_frequency, post.t31, istp);
    }
}
