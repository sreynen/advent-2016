<?php

$start = array('E' => 1, 'TG' => 1, 'TM' => 1, 'PG' => 1, 'PM' => 2, 'SG' => 1, 'SM' => 2, 'OG' => 3, 'OM' => 3, 'RG' => 3, 'RM' => 3);
$end = array('E' => 4, 'TG' => 4, 'TM' => 4, 'PG' => 4, 'PM' => 4, 'SG' => 4, 'SM' => 4, 'OG' => 4, 'OM' => 4, 'RG' => 4, 'RM' => 4);

function next_states($state) {
  $options = array();
  $types = array('T', 'P', 'S', 'O', 'R');
  $next_levels = array();
  if ($state['E'] > 1) {
    // Can go down
    $next_levels[] = $state['E'] - 1;
  }
  if ($state['E'] < 4) {
    // Can go up
    $next_levels[] = $state['E'] + 1;
  }

  foreach ($next_levels as $next_level) {

    foreach ($types as $type_1) {

      $g_1 = $state[$type_1 . 'G'];
      $m_1 = $state[$type_1 . 'M'];

      if ($g_1 == $state['E']) {

        // Check options for moving with this type of generator.

        $next_chips_lack_generator = FALSE;
        foreach ($types as $type_2) {
          if (
            ($state[$type_2 . 'M'] == $next_level) &&
            ($state[$type_2 . 'G'] != $next_level)
          ) {
            $next_chips_lack_generator = TRUE;
            break;
          }
        }

        // 1) Can move generator alone if no microchips on new level are lacking
        // generator

        if (!$next_chips_lack_generator) {
          $new_state = $state;
          $new_state['E'] = $next_level;
          $new_state[$type_1 . 'G'] = $next_level;
          $options[] = $new_state;
        }

        // 2) Can move generator with a microchip if microchip matches

        if ($m_1 == $state['E']) {
          $new_state = $state;
          $new_state['E'] = $next_level;
          $new_state[$type_1 . 'G'] = $next_level;
          $new_state[$type_1 . 'M'] = $next_level;
          $options[] = $new_state;
        }

        // 3) Can move two generators if no microchips on new level are lacking
        // generator

        if (!$next_chips_lack_generator) {
          foreach ($types as $type_2) {
            if (
              ($type_2 != $type_1) &&
              ($state[$type_2 . 'G'] == $state['E'])
            ) {
              $new_state = $state;
              $new_state['E'] = $next_level;
              $new_state[$type_1 . 'G'] = $next_level;
              $new_state[$type_2 . 'G'] = $next_level;
              $options[] = $new_state;
            }
          }
        }

      }

      if ($m_1 == $state['E']) {

        // Check options for moving with this type of microchip.

        $next_no_generators = TRUE;
        foreach ($types as $type_2) {
          if ($state[$type_2 . 'G'] == $next_level) {
            $next_no_generators = FALSE;
            break;
          }
        }

        // 1) Can move microchip alone if generator is on new level or no
        // generators on new level

        if (
          ($next_no_generators) ||
          ($state[$type_1 . 'G'] == $next_level)
        ) {
          $new_state = $state;
          $new_state['E'] = $next_level;
          $new_state[$type_1 . 'M'] = $next_level;
          $options[] = $new_state;
        }

        // 2) Can move microchip with other microchip if both chips have
        // generators on new level, or no generators on new level

        foreach ($types as $type_2) {
          if (
            ($type_2 != $type_1) &&
            ($state[$type_2 . 'M'] == $state['E'])
          ) {
            if (
              ($next_no_generators) ||
              (
                ($state[$type_1 . 'G'] == $next_level) &&
                ($state[$type_2 . 'G'] == $next_level)
              )
            ) {
              $new_state = $state;
              $new_state['E'] = $next_level;
              $new_state[$type_1 . 'M'] = $next_level;
              $new_state[$type_2 . 'M'] = $next_level;
              $options[] = $new_state;
            }
          }
        }

        // 3) Can move microchip with generator if generator matches
        // (same as generator #2 above)

      }

    }

  }

  return $options;
}


$state = $start;
$paths = array($state);
$steps = 0;
$all_states = array();

while (!in_array($end, $paths)) {
  $next_paths = array();
  foreach ($paths as $path) {
    // print 'PATH' . "\n";
    // print_r($path);
    $options = next_states($path);
    // print 'OPTIONS' . "\n";
    // print_r($options);
    foreach ($options as $option) {
      // Don't re-trace any states, avoid loops.
      if (!in_array($option, $all_states)) {
        $next_paths[] = $option;
        $all_states[] = $option;
      }
    }
  }
  $paths = array_unique($next_paths, SORT_REGULAR);
  $steps++;
  print count($paths) . ' PATHS AT STEP ' . $steps . "\n";
}

print "\n\n" . $steps . ' STEPS' . "\n";
