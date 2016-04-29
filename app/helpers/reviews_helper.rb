module ReviewsHelper
    def rating_overall(review)
        return (review.rating_cost+review.rating_area+review.rating_cleanliness+review.rating_landlord)/4
    end
    
    def average_rating(property)
        if property.reviews.count > 0
            avg = 0
            property.reviews.each do |r|
                avg += rating_overall(r)
            end
            avg /= property.reviews.count
            return avg
        else
            return -1
        end
    end
end
