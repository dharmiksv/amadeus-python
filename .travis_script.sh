if [[ $TRAVIS_EVENT_TYPE == "pull_request" && $TRAVIS_PULL_REQUEST_BRANCH != "master" ]] ; then
  python examples/hotel_search/hotel_search.py &
  PID=$! && wait $PID && sleep 0.5 && echo "done"
  python examples/flight_choice_prediction/flight_choice_prediction.py &
  PID=$! && wait $PID && sleep 0.5 && echo "done"
  python examples/flight_offers_search/flight_offers_search.py &
  PID=$! && wait $PID && sleep 0.5 && echo "done"
  python examples/hotel_ratings/hotel_ratings.py &
  PID=$! && wait $PID && sleep 0.5 && echo "done"
  python examples/points_of_interest/points_of_interest.py
fi
if [[ $TRAVIS_EVENT_TYPE == "push" && $TRAVIS_BRANCH == "master" ]] ; then
  for folder in examples/*/ ; do
    for file in "$folder"/* ; do
      if [[ $file == *.py ]]
      then
        python "$file"
      fi
    done
  done
fi