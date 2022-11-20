// The 'mbti' program.
program mbti.aleo {

    // The frequencies associated with a dictionary term.
    struct TermFrequency {
        term: string,
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

    // Up to 32 terms per post.  Each term is a 32 character string. 0-499.
    struct Post {
        t0: string,
        t1: string,
        t2: string,
        t3: string,
        t4: string,
        t5: string,
        t6: string,
        t7: string,
        t8: string,
        t9: string,
        t10: string,
        t11: string,
        t12: string,
        t13: string,
        t14: string,
        t15: string,
        t16: string,
        t17: string,
        t18: string,
        t19: string,
        t20: string,
        t21: string,
        t22: string,
        t23: string,
        t24: string,
        t25: string,
        t26: string,
        t27: string,
        t28: string,
        t29: string,
        t30: string,
        t31: string,
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
    mapping overall_frequency: string => u128;
    mapping enfj_frequency: string => u128;
    mapping enfp_frequency: string => u128;
    mapping entj_frequency: string => u128;
    mapping entp_frequency: string => u128;
    mapping esfj_frequency: string => u128;
    mapping esfp_frequency: string => u128;
    mapping estj_frequency: string => u128;
    mapping estp_frequency: string => u128;
    mapping infj_frequency: string => u128;
    mapping infp_frequency: string => u128;
    mapping intj_frequency: string => u128;
    mapping intp_frequency: string => u128;
    mapping isfj_frequency: string => u128;
    mapping isfp_frequency: string => u128;
    mapping istj_frequency: string => u128;
    mapping istp_frequency: string => u128;

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

    transition count_term_overall(term: string) -> bool {
        async finalize (term);
        return true;
    }

    finalize count_term_overall(term: string) -> u128 {
        increment(overall_frequency, term, 1u128);
    }

    transition count_term_if_enfj(label: u8, term: string) -> bool {
        let enfj: bool = false;
        let e: bool = label_flagged_e(label);
        let n: bool = label_flagged_n(label);
        let f: bool = label_flagged_f(label);
        let j: bool = label_flagged_j(label);
        enfj = e && n && f && j;
        if enfj {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_enfj(term: string) -> u128 {
        increment(enfj_frequency, term, 1u128);
    }

    transition count_term_if_enfp(label: u8, term: string) -> bool {
        let enfp: bool = false;
        let e: bool = label_flagged_e(label);
        let n: bool = label_flagged_n(label);
        let f: bool = label_flagged_f(label);
        let p: bool = label_flagged_p(label);
        enfp = e && n && f && p;
        if enfp {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_enfp(term: string) -> u128 {
        increment(enfp_frequency, term, 1u128);
    }

    transition count_term_if_entj(label: u8, term: string) -> bool {
        let entj: bool = false;
        let e: bool = label_flagged_e(label);
        let n: bool = label_flagged_n(label);
        let t: bool = label_flagged_t(label);
        let j: bool = label_flagged_j(label);
        entj = e && n && t && j;
        if entj {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_entj(term: string) -> u128 {
        increment(entj_frequency, term, 1u128);
    }

    transition count_term_if_entp(label: u8, term: string) -> bool {
        let entp: bool = false;
        let e: bool = label_flagged_e(label);
        let n: bool = label_flagged_n(label);
        let t: bool = label_flagged_t(label);
        let p: bool = label_flagged_p(label);
        entp = e && n && t && p;
        if entp {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_entp(term: string) -> u128 {
        increment(entp_frequency, term, 1u128);
    }

    transition count_term_if_esfj(label: u8, term: string) -> bool {
        let esfj: bool = false;
        let e: bool = label_flagged_e(label);
        let s: bool = label_flagged_s(label);
        let f: bool = label_flagged_f(label);
        let j: bool = label_flagged_j(label);
        esfj = e && s && f && j;
        if esfj {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_esfj(term: string) -> u128 {
        increment(esfj_frequency, term, 1u128);
    }

    transition count_term_if_esfp(label: u8, term: string) -> bool {
        let esfp: bool = false;
        let e: bool = label_flagged_e(label);
        let s: bool = label_flagged_s(label);
        let f: bool = label_flagged_f(label);
        let p: bool = label_flagged_p(label);
        esfp = e && s && f && p;
        if esfp {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_esfp(term: string) -> u128 {
        increment(esfp_frequency, term, 1u128);
    }

    transition count_term_if_estj(label: u8, term: string) -> bool {
        let estj: bool = false;
        let e: bool = label_flagged_e(label);
        let s: bool = label_flagged_s(label);
        let t: bool = label_flagged_t(label);
        let j: bool = label_flagged_j(label);
        estj = e && s && t && j;
        if estj {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_estj(term: string) -> u128 {
        increment(estj_frequency, term, 1u128);
    }

    transition count_term_if_estp(label: u8, term: string) -> bool {
        let estp: bool = false;
        let e: bool = label_flagged_e(label);
        let s: bool = label_flagged_s(label);
        let t: bool = label_flagged_t(label);
        let p: bool = label_flagged_p(label);
        estp = e && s && t && p;
        if estp {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_estp(term: string) -> u128 {
        increment(estp_frequency, term, 1u128);
    }

    transition count_term_if_infj(label: u8, term: string) -> bool {
        let infj: bool = false;
        let i: bool = label_flagged_i(label);
        let n: bool = label_flagged_n(label);
        let f: bool = label_flagged_f(label);
        let j: bool = label_flagged_j(label);
        infj = i && n && f && j;
        if infj {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_infj(term: string) -> u128 {
        increment(infj_frequency, term, 1u128);
    }

    transition count_term_if_infp(label: u8, term: string) -> bool {
        let infp: bool = false;
        let i: bool = label_flagged_i(label);
        let n: bool = label_flagged_n(label);
        let f: bool = label_flagged_f(label);
        let p: bool = label_flagged_p(label);
        infp = i && n && f && p;
        if infp {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_infp(term: string) -> u128 {
        increment(infp_frequency, term, 1u128);
    }

    transition count_term_if_intj(label: u8, term: string) -> bool {
        let intj: bool = false;
        let i: bool = label_flagged_i(label);
        let n: bool = label_flagged_n(label);
        let t: bool = label_flagged_t(label);
        let j: bool = label_flagged_j(label);
        intj = i && n && t && j;
        if intj {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_intj(term: string) -> u128 {
        increment(intj_frequency, term, 1u128);
    }

    transition count_term_if_intp(label: u8, term: string) -> bool {
        let intp: bool = false;
        let i: bool = label_flagged_i(label);
        let n: bool = label_flagged_n(label);
        let t: bool = label_flagged_t(label);
        let p: bool = label_flagged_p(label);
        intp = i && n && t && p;
        if intp {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_intp(term: string) -> u128 {
        increment(intp_frequency, term, 1u128);
    }

    transition count_term_if_isfj(label: u8, term: string) -> bool {
        let isfj: bool = false;
        let i: bool = label_flagged_i(label);
        let s: bool = label_flagged_s(label);
        let f: bool = label_flagged_f(label);
        let j: bool = label_flagged_j(label);
        isfj = i && s && f && j;
        if isfj {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_isfj(term: string) -> u128 {
        increment(isfj_frequency, term, 1u128);
    }

    transition count_term_if_isfp(label: u8, term: string) -> bool {
        let isfp: bool = false;
        let i: bool = label_flagged_i(label);
        let s: bool = label_flagged_s(label);
        let f: bool = label_flagged_f(label);
        let p: bool = label_flagged_p(label);
        isfp = i && s && f && p;
        if isfp {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_isfp(term: string) -> u128 {
        increment(isfp_frequency, term, 1u128);
    }

    transition count_term_if_istj(label: u8, term: string) -> bool {
        let istj: bool = false;
        let i: bool = label_flagged_i(label);
        let s: bool = label_flagged_s(label);
        let t: bool = label_flagged_t(label);
        let j: bool = label_flagged_j(label);
        istj = i && s && t && j;
        if istj {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_istj(term: string) -> u128 {
        increment(istj_frequency, term, 1u128);
    }

    transition count_term_if_istp(label: u8, term: string) -> bool {
        let istp: bool = false;
        let i: bool = label_flagged_i(label);
        let s: bool = label_flagged_s(label);
        let t: bool = label_flagged_t(label);
        let p: bool = label_flagged_p(label);
        istp = i && s && t && p;
        if istp {
            async finalize (term);
            return true;
        }
        else {
            return false;
        }
    }

    finalize count_term_if_istp(term: string) -> u128 {
        increment(istp_frequency, term, 1u128);
    }

    function train(label: u8, post: Post) -> PostStatistics {
        // Increment the dictionary for each term in the post.
        for delta: u8 in 0u8..32u8 {
            let index: string = "t" + delta;
            let term: string = post(index);
            if term != "" {
                let overall_frequency: bool = count_term_overall(term);
                let enfj_frequency: bool = count_term_if_enfj(label, term);
                let enfp_frequency: bool = count_term_if_enfp(label, term);
                let entj_frequency: bool = count_term_if_entj(label, term);
                let entp_frequency: bool = count_term_if_entp(label, term);
                let esfj_frequency: bool = count_term_if_esfj(label, term);
                let esfp_frequency: bool = count_term_if_esfp(label, term);
                let estj_frequency: bool = count_term_if_estj(label, term);
                let estp_frequency: bool = count_term_if_estp(label, term);
                let infj_frequency: bool = count_term_if_infj(label, term);
                let infp_frequency: bool = count_term_if_infp(label, term);
                let intj_frequency: bool = count_term_if_intj(label, term);
                let intp_frequency: bool = count_term_if_intp(label, term);
                let isfj_frequency: bool = count_term_if_isfj(label, term);
                let isfp_frequency: bool = count_term_if_isfp(label, term);
                let istj_frequency: bool = count_term_if_istj(label, term);
                let istp_frequency: bool = count_term_if_istp(label, term);
            }
        }

        return PostStatistics;
    }
}
