var expect = function(val) {
    return {
        toBe: function(a) {
            if (val === a) return true;
            else throw new Error("Not Equal");
        },
        notToBe: function(a) {
            if (val !== a) return true;
            else throw new Error("Equal");
        }
    };
};
