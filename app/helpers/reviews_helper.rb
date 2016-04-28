module ReviewsHelper
    def rating_overall(review)
        return (review.rating_landlord+review.rating_cleanliness+review.rating_area+review.rating_cost)/4
    end
end
