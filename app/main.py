from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/start_hoover', methods=['POST'])
def start_hoover():
    try:
        json_data = request.get_json()
        # Check if the required fields are present in the JSON data
        if ('roomSize' not in json_data or
            'coords' not in json_data or
            'patches' not in json_data or
            'instructions' not in json_data):
            raise ValueError('Invalid input JSON payload')

        # Parse the JSON data and perform the hoovering
        data = request.json
        room_size = data['roomSize']
        hoover_coords = data['coords']
        patches = data['patches']
        instructions = data['instructions']
        
        # Check room size, hoover, and patch bounds make sense
        x_lim, y_lim = room_size[0], room_size[1]
        if (x_lim==0 or y_lim==0):
            raise ValueError('Room size must have be greater than zero')
        if (x_lim < hoover_coords[0] or
            y_lim < hoover_coords[1]):
            raise ValueError('Initial hoover coordinates out of room bounds')
        for patch in patches:
            if (x_lim < patch[0] or
                y_lim < patch[1]):
                raise ValueError('Patches coordinates out of room bounds')

        # Initialize variables and check standing
        cleaned_patches = 0
        if hoover_coords in patches:
            cleaned_patches += 1
            patches.remove(hoover_coords)
        
        # Simulate hoover movement
        for instruction in instructions:
            if instruction == 'N' and hoover_coords[1] < room_size[1]-1:
                hoover_coords[1] += 1
            elif instruction == 'S' and hoover_coords[1] > 0:
                hoover_coords[1] -= 1
            elif instruction == 'E' and hoover_coords[0] < room_size[0]-1:
                hoover_coords[0] += 1
            elif instruction == 'W' and hoover_coords[0] > 0:
                hoover_coords[0] -= 1
            if hoover_coords in patches:
                cleaned_patches += 1
                patches.remove(hoover_coords)
        
        # Return result as JSON payload
        result = {
            "coords": hoover_coords,
            "patches": cleaned_patches
        }
    
        # Return the result as a JSON response
        return jsonify(result)
    
    except Exception as e:
        # Return an error message as a JSON response
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port='8080')