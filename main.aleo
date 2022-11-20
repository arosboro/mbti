// The 'mbti.aleo' program.
program mbti.aleo;

// The frequencies associated with a dictionary term.
interface TermFrequency:
    term: field,
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

// A dictionary mapping lemmas to TermFrequencies hased with Pedersen algorithm.
mapping dictionary:
    key term as field.public;
    value frequency as TermFrequency.public;

// A helper function to work with u8 labels.
function map_type_indicator:
    input r0 as u8.private
    r1 as u8;
    r2 as u8;
    r3 as u8;
    r4 as u8;
    r5 as u8;
    r6 as u8;
    r7 as u8;
    r8 as u8;
    cast 0b10101010 into r1; // ISTJ
    cast 0b10101001 into r2; // ISTP
    cast 0b10100110 into r3; // ISFJ
    cast 0b10100101 into r4; // ISFP
    cast 0b10011010 into r5; // INTJ
    cast 0b10011001 into r6; // INTP
    cast 0b10010110 into r7; // INFJ
    cast 0b10010101 into r8; // INFP
    cast 0b01101010 into r9; // ESTJ
    cast 0b01101001 into r10; // ESTP
    cast 0b01100110 into r11; // ESFJ
    cast 0b01100101 into r12; // ESFP
    cast 0b01011010 into r13; // ENTJ
    cast 0b01011001 into r14; // ENTP
    cast 0b01010110 into r15; // ENFJ
    cast 0b01010101 into r16; // ENFP
    is.eq r0 r1 into r17;
    is.eq r0 r2 into r18;
    is.eq r0 r3 into r19;
    is.eq r0 r4 into r20;
    is.eq r0 r5 into r21;
    is.eq r0 r6 into r22;
    is.eq r0 r7 into r23;
    is.eq r0 r8 into r24;
    is.eq r0 r9 into r25;
    is.eq r0 r10 into r26;
    is.eq r0 r11 into r27;
    is.eq r0 r12 into r28;
    is.eq r0 r13 into r29;
    is.eq r0 r14 into r30;
    is.eq r0 r15 into r31;
    is.eq r0 r16 into r32;


    return r17;

 function train() {
     input r0 as Post.private;
     let r1 = r0.label;
     let r2 = r0.terms
     for i in 0..r2.size() {
         let r3 = r2[i];
         let r4 = dictionary[r3];
         let r5 = map_type_indicator(r1);
         if is.eq(r4, null):
             let r6 = TermFrequency();
             r6.term = r3;
             r6.overall_frequency = 1;
             dictionary[r3] = r6;
             if eq(r5, "enfj") {
                 r6.enfj_frequency = 1;
             } else if eq(r5, "ENFP") {
                 r6.enfp_frequency = 1;
             } else if eq(r5, "ENTJ") {
                 r6.entj_frequency = 1;
             } else if eq(r5, "ENTP") {
                 r6.entp_frequency = 1;
             } else if eq(r5, "ESFJ") {
                 r6.esfj_frequency = 1;
             } else if eq(r5, "ESFP") {
                 r6.esfp_frequency = 1;
             } else if eq(r5, "ESTJ") {
                 r6.estj_frequency = 1;
             } else if eq(r5, "ESTP") {
                 r6.estp_frequency = 1;
             } else if eq(r5, "INFJ") {
                 r6.infj_frequency = 1;
             } else if eq(r5, "INFP") {
                 r6.infp_frequency = 1;
             } else if eq(r5, "INTJ") {
                 r6.intj_frequency = 1;
             } else if eq(r5, "INTP") {
                 r6.intp_frequency = 1;
             } else if eq(r5, "ISFJ") {
                 r6.isfj_frequency = 1;
             } else if eq(r5, "ISFP") {
                 r6.isfp_frequency = 1;
             } else if eq(r5, "ISTJ") {
                 r6.istj_frequency = 1;
             } else if eq(r5, "ISTP") {
                 r6.istp_frequency = 1;
             }
         } else {
             r4.overall_frequency = r4.overall_frequency + 1;
             if is.eq(r5, "ENFJ") {
                 r4.enfj_frequency = r4.enfj_frequency + 1;
             } else if eq(r5, "ENFP") {
                 r4.enfp_frequency = r4.enfp_frequency + 1;
             } else if eq(r5, "ENTJ") {
                 r4.entj_frequency = r4.entj_frequency + 1;
             } else if eq(r5, "ENTP") {
                 r4.entp_frequency = r4.entp_frequency + 1;
             } else if eq(r5, "ESFJ") {
                 r4.esfj_frequency = r4.esfj_frequency + 1;
             } else if eq(r5, "ESFP") {
                 r4.esfp_frequency = r4.esfp_frequency + 1;
             } else if eq(r5, "ESTJ") {
                 r4.estj_frequency = r4.estj_frequency + 1;
             } else if eq(r5, "ESTP") {
                 r4.estp_frequency = r4.estp_frequency + 1;
             } else if eq(r5, "INFJ") {
                 r4.infj_frequency = r4.infj_frequency + 1;
             } else if eq(r5, "INFP") {
                 r4.infp_frequency = r4.infp_frequency + 1;
             } else if eq(r5, "INTJ") {
                 r4.intj_frequency = r4.intj_frequency + 1;
             } else if eq(r5, "INTP") {
                 r4.intp_frequency = r4.intp_frequency + 1;
             } else if eq(r5, "ISFJ") {
                 r4.isfj_frequency = r4.isfj_frequency + 1;
             } else if eq(r5, "ISFP") {
                 r4.isfp_frequency = r4.isfp_frequency + 1;
             } else if eq(r5, "ISTJ") {
                 r4.istj_frequency = r4.istj_frequency + 1;
             } else if eq(r5, "ISTP") {
                 r4.istp_frequency = r4.istp_frequency + 1;
             }
         }
     }
 }
