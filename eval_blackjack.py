import json


def get_hands():
    hashes_low = []
    hashes_middle = []
    hashes_high = []
    for card1_val in range(1,52):
        for card2_val in range(1,52):
            card_ints = [card1_val,card2_val,0,0,0,0,0,0,0,0,0]
            p = 524288
            a = 14514
            vl = 0
            for i in range(0,11):
                vl += card_ints[i]*(a**i) % p
            # print(vl)
            if card1_val + card2_val <= 12:
                hashes_low.append(vl)
            elif card1_val + card2_val <= 48:
                hashes_middle.append(vl)
            else:
                hashes_high.append(vl)

    return hashes_low,hashes_middle,hashes_high


# def get_low_hand():
#     # consider all hands where 
#     hashes = []
#     for card1_val in range(1,12):
#         for card2_val in range(1,12):
#             card_ints = [card1_val,card2_val,0,0,0,0,0,0,0,0,0]
#             p = 524288
#             a = 14514
#             vl = 0
#             for i in range(0,11):
#                 vl += card_ints[i]*(a**i) % p
#             hashes.append(vl)
#     return hashes


# def get_middle_hand():
#     # consider all hands where 
#     hashes = []
#     for card1_val in range(13,33):
#         for card2_val in range(13,33):
#             card_ints = [card1_val,card2_val,0,0,0,0,0,0,0,0,0]
#             p = 524288
#             a = 14514
#             vl = 0
#             for i in range(0,2):
#                 vl += card_ints[i]*(a**i) % p
#             hashes.append(vl)
#     return hashes



# def get_high_hand():
#     # consider all hands where 
#     hashes = []
#     for card1_val in range(34,52):
#         for card2_val in range(33,52):
#             card_ints = [card1_val,card2_val,0,0,0,0,0,0,0,0,0]
#             p = 524288
#             a = 14514
#             vl = 0
#             for i in range(0,11):
#                 vl += card_ints[i]*(a**i) % p
#             hashes.append(vl)
#     return hashes


def main():
    low,middle,high = get_hands()

    low_threshold = max(low)
    middle_threshold = max(middle)
    print(low_threshold)
    print(middle_threshold)

     # low = get_low_hand()
    low_avg = 0.0
    count_low = 0
    # high = get_high_hand()
    count_middle = 0
    middle_avg = 0.0
    # high = get_high_hand()
    count_high = 0
    high_avg = 0.0

    for i in range(0,2048):
        # print(i)
        # json_name = "./Data/16_Gen300/" + str(i) + ".json"
        json_name = "./Data/32_Gen213/" + str(i) + ".json"

        # find avg 
        with open(json_name) as json_file:
            data = json.load(json_file)
            for hash in data:
                # print(hash)
                # check if hash is low or high
                int_hash = int(hash)
                if int_hash <= low_threshold:
                    low_avg += data[hash][104]
                    count_low += 1
                elif int_hash <= middle_threshold:
                    middle_avg += data[hash][104]
                    count_middle += 1
                else:
                    high_avg += data[hash][104]
                    count_high += 1
                # if int_hash in low:
                #     low_avg += data[hash][104]
                #     count_low += 1
                # elif int_hash in middle:
                #     middle_avg += data[hash][104]
                #     count_middle += 1
                # elif int_hash in high:
                #     high_avg += data[hash][104]
                #     count_high += 1
    print("count low: %i" % count_low)
    print("count middle: %i" % count_middle)
    print("count high: %i" % count_high)

    avg_low_f = 0.0
    avg_middle_f = 0.0
    avg_high_f = 0.0
    if count_low > 0:
        avg_low_f = low_avg/count_low
    if count_middle > 0:
        avg_middle_f = middle_avg/count_middle
    if count_high > 0:
        avg_high_f = high_avg/count_high
    print("avg low: %f" % avg_low_f)
    print("avg middle: %f" % avg_middle_f)
    print("avg high: %f" % avg_high_f)

    print("avg low': %f" % low_avg)
    print("avg middle': %f" % middle_avg)
    print("avg high': %f" % high_avg)
    

if __name__ == "__main__":
    main()